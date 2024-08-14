return {
	"luukvbaal/statuscol.nvim",
	event = { "BufNewFile", "BufReadPre" },
	config = function()
		require("custom.statuscol")
	end,
}
