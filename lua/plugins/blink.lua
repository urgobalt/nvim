return {
  "saghen/blink.cmp",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua",
      config = true,
    },
    "rafamadriz/friendly-snippets",
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
    "kristijanhusak/vim-dadbod-ui",
    {
      "mikavilpas/blink-ripgrep.nvim",
      version = "*", -- use the latest stable version
    },
  },

  version = "*",

  config = function()
    require("custom.blink")
  end,
  opts_extend = { "sources.default" },
}
