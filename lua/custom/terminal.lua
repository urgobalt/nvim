local terminal = require("terminal")

terminal.setup({
  layout = { open_cmd = "enew" },
  cmd = { vim.o.shell },
  autoclose = false,
})

-- Leave terminal mode
vim.keymap.set(
  "t",
  "<C-n>",
  "<C-\\><C-n>",
  { noremap = true, desc = "Leave terminal mode" }
)
vim.keymap.set(
  "t",
  "<C-A-n>",
  "<C-\\><C-n>",
  { noremap = true, desc = "Leave terminal mode" }
)

-- Manage terminals
vim.keymap.set({ "n", "o" }, "<C-t>", terminal.open, { desc = "Open terminal" })
