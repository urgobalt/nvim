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

vim.g.compile_mode = {
  input_word_completion = true,
  baleia_setup = true,
  bang_expansion = true,
  ask_about_save = false,
}

-- Run in terminal
vim.keymap.set(
  { "n", "o" },
  "<C-t>",
  ":Compile ",
  { desc = "Open terminal" }
)
