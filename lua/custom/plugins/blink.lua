return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"tpope/vim-dadbod",
		"kristijanhusak/vim-dadbod-completion",
		"kristijanhusak/vim-dadbod-ui",
	},

	version = "*",

	config = function()
		require("custom.blink")
	end,
	opts_extend = { "sources.default" },
}
