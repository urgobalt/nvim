return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
    "nvim-telescope/telescope-fzy-native.nvim",
    "nvim-treesitter/nvim-treesitter",
    "neovim/nvim-lspconfig",
    "nvim-tree/nvim-web-devicons",
    "cljoly/telescope-repo.nvim",
  },
  config = function()
    require("custom.telescope")
  end,
}
