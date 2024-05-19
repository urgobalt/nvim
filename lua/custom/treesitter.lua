local ensure_installed = {
	"lua",
	"rust",
	"ocaml",
	"c",
	"java",
	"javascript",
	"typescript",
	"html",
	"css",
	"markdown",
	"fish",
}

require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.configs").setup({
	ensure_installed = ensure_installed,
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
