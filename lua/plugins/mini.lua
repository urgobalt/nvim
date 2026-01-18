return {
  "echasnovski/mini.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
  },
  version = false,
  config = function()
    require("custom.mini")
  end,
}
