return {
  "echasnovski/mini.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  version = false,
  config = function()
    require("custom.mini")
  end,
}
