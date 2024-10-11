return {
	"nvim-lualine/lualine.nvim",
	enabled = require("config.util").is_enabled("nvim-lualine/lualine.nvim"),
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = {
				"filename",
			},
			lualine_x = { "encoding", { "fileformat", symbols = { unix = "" } }, "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
