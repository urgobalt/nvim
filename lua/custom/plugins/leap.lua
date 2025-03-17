return {
  "ggandor/leap.nvim",
  lazy = false,
  dependencies = { "tpope/vim-repeat" },
  config = function()
    vim.keymap.set(
      { "n", "x", "o" },
      "q",
      "<Plug>(leap-forward)",
      { desc = "Leap forward" }
    )
    vim.keymap.set(
      { "n", "x", "o" },
      "Q",
      "<Plug>(leap-backward)",
      { desc = "Leap backward" }
    )
  end,
}
