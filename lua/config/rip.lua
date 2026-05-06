require("rip-substitute").setup()

vim.keymap.set(
  { "n", "x" },
  "<leader>r",
  function() require("rip-substitute").sub() end,
  { desc = "Rip substitute" }
)
