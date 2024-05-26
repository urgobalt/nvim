return {
	"lewis6991/hover.nvim",
	config = function()
		require("hover").setup({
			init = function()
				-- Require providers
				require("hover.providers.lsp")
				require("hover.providers.gh")
				-- require('hover.providers.gh_user')
				-- require('hover.providers.jira')
				-- require('hover.providers.dap')
				-- require('hover.providers.man')
				-- require('hover.providers.dictionary')
			end,
			preview_opts = {
				border = "single",
			},
			preview_window = true,
			title = true,
		})

		-- Setup keymaps
		vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
		vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
        -- stylua: ignore start
		-- Selections
		---@diagnostic disable
		vim.keymap.set("n", "<C-p>", function() require("hover").hover_switch("previous") end, { desc = "Next source" })
		vim.keymap.set("n", "<C-n>", function() require("hover").hover_switch("next") end, { desc = "Next source" })
		---@diagnostic enable
		-- stylua: ignore end
	end,
}
