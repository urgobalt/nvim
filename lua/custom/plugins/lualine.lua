return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
	config = function()
		require("custom.lualine")
	end,
}
