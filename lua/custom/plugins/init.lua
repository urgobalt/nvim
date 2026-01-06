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
    ---@module "indent_blankline"
    ---@type ibl.config
    opts = {
      exclude = {
        filetypes = { "dashboard" },
      },
      scope = { enabled = false },
    },
  },
  { "yorickpeterse/nvim-pqf", config = true },
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
  {
    "mrjones2014/smart-splits.nvim",
    build = "./kitty/install-kittens.bash",
    config = function()
      local splits = require("smart-splits")
      require("smart-splits").setup({})

      -- resizing splits
      vim.keymap.set("n", "<A-C-h>", splits.resize_left)
      vim.keymap.set("n", "<A-C-j>", splits.resize_down)
      vim.keymap.set("n", "<A-C-k>", splits.resize_up)
      vim.keymap.set("n", "<A-C-l>", splits.resize_right)

      -- moving between splits
      vim.keymap.set("n", "<C-h>",  splits.move_cursor_left)
      vim.keymap.set("n", "<C-j>",  splits.move_cursor_down)
      vim.keymap.set("n", "<C-k>",  splits.move_cursor_up)
      vim.keymap.set("n", "<C-l>",  splits.move_cursor_right)
      vim.keymap.set("n", "<C-\\>", splits.move_cursor_previous)
    end,
  },
  {
    "Vonr/align.nvim",
    branch = "v2",
    lazy = true,
    init = function()
      -- Create your mappings here
      vim.keymap.set("x", "gaw", function()
        require("align").align_to_string({
          regex = true,
        })
      end, { desc = "Align to string/regex" })
    end,
  },
}
