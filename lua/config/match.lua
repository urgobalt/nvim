require("match").setup({
  prefix = "",
  anchor = "NE",
  style = "minimal",
  border = "rounded",
  border_hl = "Function",
})

vim.keymap.set("n", "/", "<CMD>Match<CR>", { desc = "Find and replace functionality" })
