return {
  "tpope/vim-surround",
  { "NMAC427/guess-indent.nvim", enabled = false, config = true },
  { "folke/todo-comments.nvim", config = true },
  { "RaafatTurki/hex.nvim", config = true },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set(
        "n",
        "<leader>u",
        "<cmd>UndotreeToggle<CR>",
        { desc = "Toggle undotree" }
      )
    end,
  },
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({})

      vim.keymap.set(
        "n",
        "<leader>o",
        "<cmd>Trouble diagnostics toggle focus=false<CR>",
        { desc = "Toggle trouble" }
      )
    end,
  },
  {
    "laytan/cloak.nvim",
    config = function()
      require("cloak").setup({})
    end,
  },
  {
    "siawkz/nvim-cheatsh",
    enabled = false,
    dependecies = {
      "nvim-telescope/telescope.nvim",
      "ibhagwan/fzf-lua",
    },
    config = function()
      require("nvim-cheatsh").setup({
        cheatsh_url = "https://cht.sh/",
        position = "top",
        height = 30,
      })
      vim.keymap.set(
        "n",
        "<leader>to",
        "<cmd>CheatList<CR>",
        { desc = "List availiable cheat sheets" }
      )
    end,
  },
  {
    "airblade/vim-rooter",
    config = function()
      vim.g.rooter_patterns = {
        ".git",
        ".jj",
        "node_modules",
        "package.json",
        "cargo.toml",
        "project.json",
      }

      vim.g.rooter_buftypes = { "", "acwrite" }
    end,
  },
  "sitiom/nvim-numbertoggle",
  { "yorickpeterse/nvim-pqf", config = true },
}
