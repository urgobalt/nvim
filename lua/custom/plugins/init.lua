return {
	"tpope/vim-surround",
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{ "NMAC427/guess-indent.nvim", config = true },
	{ "folke/todo-comments.nvim", config = true },
	{ "RaafatTurki/hex.nvim", config = true },
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Toggle undotree" })
		end,
	},
	{
		"folke/trouble.nvim",
		config = function()
			vim.keymap.set("n", "<leader>o", "<cmd>Trouble<CR>", { desc = "Toggle trouble" })
		end,
	},
}
