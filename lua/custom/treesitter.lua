require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.configs").setup({
	sync_install = false,
	ensure_installed = {
		"lua",
		"rust",
		"ocaml",
		"c",
		"java",
		"javascript",
		"typescript",
		"html",
		"css",
		"fish",
		"markdown",
		"markdown_inline",
	},
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
