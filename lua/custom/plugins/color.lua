return {
	{
		"kvrohit/rasmus.nvim",
		config = function()
			vim.cmd.colorscheme("rasmus")
		end,
	},
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
				extra_groups = {
					"NormalFloat",
					"FloatBorder",
				},
			})
		end,
	},
}
