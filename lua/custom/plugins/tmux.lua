return {
	"aserowy/tmux.nvim",
	config = function()
		local tmux = require("tmux")
		tmux.setup({
			navigation = {
				enable = false,
				-- enable_default_keybindings = true,
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

		vim.keymap.set({ "n", "c" }, "<C-h>", tmux.move_left)
		vim.keymap.set({ "n", "c" }, "<C-j>", tmux.move_bottom)
		vim.keymap.set({ "n", "c" }, "<C-k>", tmux.move_top)
		vim.keymap.set({ "n", "c" }, "<C-l>", tmux.move_right)
	end,
}
