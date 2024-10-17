return {
	"lewis6991/gitsigns.nvim",
	dependencies = {
		"tpope/vim-fugitive",
		"nvim-telescope/telescope.nvim",
		{
			"polarmutex/git-worktree.nvim",
			dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		},
	},
	config = function()
		require("custom.git")
	end,
}
