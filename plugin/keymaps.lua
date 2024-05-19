local set = vim.keymap.set

-- Buffer actions
set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save current buffer to file" })
set("n", "<leader>q", "<cmd>q<CR>", { desc = "Exit current buffer" })

-- Splits move
set("n", "<c-j>", "<c-w><c-j>")
set("n", "<c-k>", "<c-w><c-k>")
set("n", "<c-l>", "<c-w><c-l>")
set("n", "<c-h>", "<c-w><c-h>")

-- Splits resize
set("n", "<c-m-j>", "<c-w>2+")
set("n", "<c-m-k>", "<c-w>2-")
set("n", "<c-m-l>", "<c-w>5>")
set("n", "<c-m-h>", "<c-w>5<")

-- Toggle hlsearch if it is currently active
set("n", "<CR>", function()
	---@diagnostic disable-next-line: undefined-field
	if vim.opt.hlsearch:get() then
		vim.cmd.nohl()
		return ""
	else
		return "<CR>"
	end
end, { expr = true })

-- Remap macro record
set("n", "§", "q")
set("n", "q", "<Nop>")
