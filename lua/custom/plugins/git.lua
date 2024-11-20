return {
	"lewis6991/gitsigns.nvim",
	dependencies = {
		"tpope/vim-fugitive",
		"sindrets/diffview.nvim",
		"polarmutex/git-worktree.nvim",
		"ldelossa/gh.nvim",
		-- Not really git
		"nvim-telescope/telescope.nvim",
		"nvim-dev/plenary.nvim",
		"ldelossa/litee.nvim",
	},
	config = function()
		require("custom.git")
	end,
}
