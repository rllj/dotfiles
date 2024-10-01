return { -- Autoformat
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			local disable_filetypes = { c = true, cpp = true }
			if
				vim.g.disable_autoformat
				-- or vim.bo[bufnr].disable_autoformat
				or disable_filetypes[vim.bo[bufnr].filetype]
			then
				return
			end
			return { timeout_ms = 500, lsp_fallback = true }
		end,
		formatters = {
			prettierd = {
				require_cwd = true,
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },

			-- js/ts
			javascript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		},
	},
}
