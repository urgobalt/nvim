return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "BurntSushi/ripgrep",
    "nvim-telescope/telescope-fzy-native.nvim",
    "nvim-treesitter/nvim-treesitter",
    "cljoly/telescope-repo.nvim",
    "Snikimonkd/telescope-git-conflicts.nvim",
  },
  config = function()
    require("custom.telescope")
  end,
}
