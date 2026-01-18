return {
  {
    "vague2k/huez.nvim",
    branch = "stable",
    event = "UIEnter",
    import = "huez-manager.import",
    config = function()
      require("huez").setup({
        fallback = "neobones",
        exclude = {
          "default",
          "minicyan",
          "minischeme",
        },
      })

      vim.keymap.set("n", "<leader>ht", "<CMD>Huez<CR>")
      vim.keymap.set("n", "<leader>hf", "<CMD>HuezFavorites<CR>")
      vim.keymap.set("n", "<leader>hl", "<CMD>HuezLive<CR>")
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").setup({
        extra_groups = {
          "NormalFloat",
          "FloatBorder",
          "TelescopeNormal",
          "TelescopeBorder",
          "TelescopePromptBorder",
          "FoldColumn",
        },
      })
    end,
  },
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
  },
  "rebelot/kanagawa.nvim",
  "vim-scripts/MountainDew.vim",
  "TheNiteCoder/mountaineer.vim",
  -- Utils
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup({})
    end,
  },
  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = function()
      require("colortils").setup()
    end,
  },
}
