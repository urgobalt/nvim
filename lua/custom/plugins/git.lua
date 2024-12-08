return {
	"lewis6991/gitsigns.nvim",
	dependencies = {
		"tpope/vim-fugitive",
		{ "akinsho/git-conflict.nvim", version = "*" },
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
