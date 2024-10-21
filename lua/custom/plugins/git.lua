return {
	"lewis6991/gitsigns.nvim",
	dependencies = {
		"tpope/vim-fugitive",
		"nvim-telescope/telescope.nvim",
		{ "polarmutex/git-worktree.nvim", version = "^2" },
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("custom.git")
	end,
}
