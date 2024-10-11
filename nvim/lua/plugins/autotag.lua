return {
	"windwp/nvim-ts-autotag",
	enabled = require("config.util").is_enabled("windwp/nvim-ts-autotag"),
	config = function()
		require("nvim-ts-autotag").setup()
	end,
}
