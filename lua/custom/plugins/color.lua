return {
	{
		"vague2k/huez.nvim",
		branch = "stable",
		event = "UIEnter",
		import = "huez-manager.import",
		config = function()
			require("huez").setup({
				fallback = "rasmus",
				exclude = {
					"default",
					"minicyan",
					"minischeme",
				},
			})

			vim.keymap.set("n", "<leader>ht", "<CMD>Huez<CR>")
			vim.keymap.set("n", "<leader>hf", "<CMD>HuezFavorites<CR>")
			vim.keymap.set("n", "<leader>hl", "<CMD>HuezLive<CR>")
		end,
	},
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
				extra_groups = {
					"NormalFloat",
					"FloatBorder",
					"TelescopeNormal",
					"TelescopeBorder",
					"TelescopePromptBorder",
					"FoldColumn",
				},
			})
		end,
	},
	{
		"kvrohit/rasmus.nvim",
		config = function()
			vim.g.rasmus_italic_comments = false
			vim.g.rasmus_bold_comments = false
			vim.g.rasmus_italic_keywords = true
			vim.g.rasmus_bold_keywords = false
			vim.g.rasmus_italic_booleans = false
			vim.g.rasmus_bold_booleans = false
			vim.g.rasmus_italic_functions = false
			vim.g.rasmus_bold_functions = true
			vim.g.rasmus_italic_variables = false
			vim.g.rasmus_bold_variables = false

			vim.g.rasmus_variant = "dark"

			-- vim.cmd.colorscheme("rasmus")
		end,
	},
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
	},
	"rebelot/kanagawa.nvim",
	"vim-scripts/MountainDew.vim",
	"TheNiteCoder/mountaineer.vim",
	-- Utils
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},
	{
		"max397574/colortils.nvim",
		cmd = "Colortils",
		config = function()
			require("colortils").setup()
		end,
	},
	"rktjmp/lush.nvim",
}
