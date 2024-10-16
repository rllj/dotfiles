--- https://github.com/arsham/shark/blob/v3.0.0/lua/config/util.lua
local M = {}

local plugins = require("config.disabled_list")

---Keeps the state of the conditions so we don't have to check the same plugin
---if it is a dependency of multiple plugins.
local disabled_cache = {
	---@type table<string, boolean>
	start = {}, -- should start
	---@type table<string, boolean>
	no_start = {}, -- should not start
	---@type table<string, boolean>
	pending = {}, -- plugins that are being checked to prevent infinite loops
}

---Returns true if the plugin's state with the mode is true.
---@param short_name string e.g. "arshlib.nvim"
---@return boolean
local function should_start(short_name)
	if disabled_cache.no_start[short_name] then
		return false
	end
	if disabled_cache.start[short_name] then
		return true
	end

	disabled_cache.pending[short_name] = true

	---@param ok boolean
	---@return boolean
	local function defer(ok)
		if ok then
			disabled_cache.start[short_name] = true
		else
			disabled_cache.no_start[short_name] = true
		end
		disabled_cache.pending[short_name] = nil
		return ok
	end

	---@type LazyPlugin?
	local spec = require("lazy.core.config").spec.plugins[short_name]
	---@type string
	local name
	if spec then
		name = spec[1]
	end

	if plugins[name] and not plugins[name].start then
		return defer(false)
	end
	if plugins[name] and not plugins[name].enabled then
		return defer(false)
	end

	if not spec or not spec.dependencies then
		return defer(true)
	end

	for _, dep in ipairs(spec.dependencies) do
		if not disabled_cache.pending[dep] then
			if not should_start(dep) then
				return defer(false)
			end
		end
	end
	return defer(true)
end

---Returns true if the plugin is enabled. Disabled plugins are listed in the
-- plugins table.
---@param name string e.g. "arsham/arshlib.nvim"
---@return boolean
function M.is_enabled(name)
	if plugins[name] and not plugins[name].enabled then
		return false
	end
	return true
end

---Returns true if the plugin should be loaded. Disabled plugins are listed in
-- the plugins table.
---@param name string e.g. "arsham/arshlib.nvim"
---@return fun(LazyPlugin):boolean
function M.should_start(name)
	return function(spec)
		if name ~= nil then
			local p_name = vim.gsplit(name, "/", true)
			p_name()
			p_name = p_name()
			---@type LazyPlugin?
			spec = require("lazy.core.config").spec.plugins[p_name]
		end
		if not spec then
			return true
		end
		return should_start(spec.name)
	end
end

return M
