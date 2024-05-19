require("mini.comment").setup()
require("mini.move").setup({
	options = {
		reindent_linewise = true,
	},
})
local bufremove = require("mini.bufremove")
bufremove.setup({ silent = true })

vim.keymap.set("n", "<leader>bq", bufremove.delete, { desc = "Delete current buffer while preserving layout" })
