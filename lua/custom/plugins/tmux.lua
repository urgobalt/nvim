return {
	"aserowy/tmux.nvim",
	config = function()
		local tmux = require("tmux")
		tmux.setup({
			navigation = {
				enable_default_keybindings = true,
			},
			resize = {
				enable_default_keybindings = false,
				resize_step_y = 2,
				resize_step_x = 5,
			},
			copy_sync = {
				enable = false,
			},
		})

		vim.keymap.set("n", "<C-A-h>", tmux.resize_left, { desc = "Resize left" })
		vim.keymap.set("n", "<C-A-j>", tmux.resize_bottom, { desc = "Resize bottom" })
		vim.keymap.set("n", "<C-A-k>", tmux.resize_top, { desc = "Resize top" })
		vim.keymap.set("n", "<C-A-l>", tmux.resize_right, { desc = "Resize right" })
	end,
}
