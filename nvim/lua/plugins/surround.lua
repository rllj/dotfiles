return {
	"kylechui/nvim-surround",
	enabled = require("config.util").is_enabled("kylechui/nvim-surround"),
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({
			-- Configuration here, or leave empty to use defaults
		})
	end,
}
