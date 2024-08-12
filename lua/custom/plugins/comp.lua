return {
	"hrsh7th/nvim-cmp",
	lazy = false,
	priority = 100,
	dependencies = {
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
	},
	config = function()
		require("custom.comp")
	end,
}
