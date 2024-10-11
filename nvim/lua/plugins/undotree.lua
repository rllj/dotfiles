return {
	"debugloop/telescope-undo.nvim",
	enabled = require("config.util").is_enabled("debugloop/telescope-undo.nvim"),
	dependencies = {
		{
			"nvim-telescope/telescope.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
	},
	keys = {
		{ -- lazy style key map
			"<leader>u",
			"<cmd>Telescope undo<cr>",
			desc = "undo history",
		},
	},
	opts = {
		extensions = {
			undo = {
				-- telescope-undo.nvim config, see below
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("undo")
	end,
}
