return {
	"windwp/nvim-autopairs",
	enabled = require("config.util").is_enabled("windwp/nvim-autopairs"),
	event = "InsertEnter",
	config = true,
	-- use opts = {} for passing setup options
	-- this is equalent to setup({}) function
}
