local set = vim.keymap.set
local del = vim.keymap.del

-- Buffer actions
set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save current buffer to file" })
-- set("n", "<leader>q", "<cmd>q<CR>", { desc = "Exit current buffer" })
set(
  "n",
  "<C-w>q",
  "<cmd>close<CR>",
  { desc = "Close window without closing neovim" }
)

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

-- Ctrl+Backspace support
set("i", "<C-BS>", "<C-W>")
