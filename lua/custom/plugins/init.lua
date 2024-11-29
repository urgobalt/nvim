return {
	"tpope/vim-surround",
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
			require("trouble").setup({})

			vim.keymap.set(
				"n",
				"<leader>o",
				"<cmd>Trouble diagnostics toggle focus=false<CR>",
				{ desc = "Toggle trouble" }
			)
		end,
	},
	{
		"laytan/cloak.nvim",
		config = function()
			require("cloak").setup({})
			vim.keymap.set("n", "<leader>ct", "<cmd>CloakToggle<CR>", { desc = "Toggle cloak" })
		end,
	},
	{
		"siawkz/nvim-cheatsh",
		dependecies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("nvim-cheatsh").setup({
				cheatsh_url = "https://cht.sh/",
				position = "top",
				height = 30,
			})
			vim.keymap.set("n", "<leader>to", "<cmd>CheatList<CR>", { desc = "List availiable cheat sheets" })
		end,
	},
	"airblade/vim-rooter",
	"sitiom/nvim-numbertoggle",
	{
		"ecthelionvi/NeoColumn.nvim",
		config = function()
			require("NeoColumn").setup({
				always_on = true,
				NeoColumn = { "80", "120" },
			})
		end,
	},
}
