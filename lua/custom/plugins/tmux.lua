return {
	"aserowy/tmux.nvim",
	config = function()
		local tmux = require("tmux")
		tmux.setup({
			navigation = {
				enable_default_keybindings = true,
			},
			resize = {
				enable_default_keybindings = true,
				resize_step_y = 2,
				resize_step_x = 5,
			},
		})
	end,
}
