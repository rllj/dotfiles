return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = {
				"filename",
				function()
					return vim.fn["nvim_treesitter#statusline"](180)
				end,
			},
			lualine_x = { "encoding", { "fileformat", symbols = { unix = "" } }, "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
