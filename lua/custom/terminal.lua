local terminal = require("terminal")

terminal.setup({
	layout = {
		open_cmd = "enew",
	},
})

-- Leave terminal mode
vim.keymap.set("t", "<C-n>", "<C-\\><C-n>", { noremap = true, desc = "Leave terminal mode" })

-- Manage terminals
vim.keymap.set("n", "<C-t>", terminal.open, { desc = "Open terminal" })
