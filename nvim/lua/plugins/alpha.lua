return {
	"goolord/alpha-nvim",
	config = function()
		require("config.alpha").section.footer.val = require("alpha.fortune")()
		require("alpha").setup(require("config.alpha").opts)
	end,
}
