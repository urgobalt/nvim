return {
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
    "airblade/vim-rooter",
    config = function()
      vim.g.rooter_patterns = {
        ".git",
        ".jj",
        "node_modules",
        "package.json",
        "cargo.toml",
        "project.json",
        ".direnv",
        "dune-project",
        "Dockerfile",
        "docker-compose.yaml",
        "docker-compose.yml",
      }

      vim.g.rooter_buftypes = { "", "acwrite" }
    end,
  },
  "sitiom/nvim-numbertoggle",
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      exclude = {
        filetypes = { "dashboard" },
      },
    },
  },
  { "yorickpeterse/nvim-pqf", config = true },
  { "MagicDuck/grug-far.nvim", config = true },
  {
    "LunarVim/bigfile.nvim",
    config = function()
      require("bigfile").setup({
        filesize = 100,
        pattern = { "*" },
        features = {
          "indent_blankline",
          "illuminate",
          "lsp",
          "treesitter",
          "syntax",
          "matchparen",
          "vimopts",
          "filetype",
        },
      })
    end,
  },
}
