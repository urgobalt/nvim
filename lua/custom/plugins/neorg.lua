return {
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"3rd/image.nvim",
		},
		config = function()
			require("custom.neorg")
		end,
	},
}
