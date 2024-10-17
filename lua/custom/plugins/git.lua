return {
	"lewis6991/gitsigns.nvim",
	dependencies = {
		"tpope/vim-fugitive",
		"nvim-telescope/telescope.nvim",
		"ThePrimeagen/git-worktree.nvim",
	},
	config = function()
		require("custom.git")
	end,
}
