return { -- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	enabled = require("config.util").is_enabled("echasnovski/mini.nvim"),
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [']quote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai")
	end,
}
