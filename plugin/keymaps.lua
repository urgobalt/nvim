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

-- set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
-- set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
-- set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
-- set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
--
-- set("n", "<C-S-l>", "20<C-w>l", { desc = "Move to right window" })
-- set("n", "<C-S-h>", "20<C-w>h", { desc = "Move to left window" })
-- set("n", "<C-S-j>", "10<C-w>+", { desc = "Move to bottom window" })
-- set("n", "<C-S-k>", "10<C-w>+", { desc = "Move to top window" })

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
