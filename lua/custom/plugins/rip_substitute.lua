return {
  "chrisgrieser/nvim-rip-substitute",
  config = function()
    require("rip-substitute").setup()
    vim.keymap.set(
      "n",
      "<leader>r",
      "<cmd>RipSubstitute<cr>",
      { desc = "Rip substitue" }
    )
  end,
}
