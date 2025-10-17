return {
  "chrisgrieser/nvim-rip-substitute",
  cmd = "RipSubstitute",
  config = function()
    require("rip-substitute").setup()
    vim.keymap.set(
      "n",
      "<leader>r",
      "RipSubstitute",
      { desc = "Rip substitue" }
    )
  end,
}
