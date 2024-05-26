return {
	"lewis6991/gitsigns.nvim",
	dependencies = {
		"tpope/vim-fugitive",
	},
	config = function()
		require("custom.git")
	end,
}
