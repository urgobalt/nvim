return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter",
			{
				"gaoDean/autolist.nvim",
				ft = {
					"markdown",
				},
			},
			{
				"MeanderingProgrammer/markdown.nvim",
				dependencies = {
					"nvim-tree/nvim-web-devicons",
				},
				main = "render-markdown",
			},
		},
		config = function()
			require("custom.notes")
		end,
	},
}
