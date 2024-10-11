return {
	"goolord/alpha-nvim",
	enabled = require("config.util").is_enabled("goolord/alpha-nvim"),
	config = function()
		require("config.alpha").section.footer.val = require("alpha.fortune")()
		require("alpha").setup(require("config.alpha").opts)
	end,
}
