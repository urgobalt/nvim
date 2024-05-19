return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function() require("custom.treesitter") end,
  "nvim-treesitter/nvim-treesitter-context",
}
