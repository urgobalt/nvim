return {
	"tpope/vim-fugitive",
	dependencies = {
		"lewis6991/gitsigns.nvim",
	},
	config = function()
		require("custom.git")
	end,
}
