return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "folke/neoconf.nvim",
  },
  config = function()
    require("custom.lsp")
  end,
}
