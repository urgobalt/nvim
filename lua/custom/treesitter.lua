require("nvim-treesitter.install").prefer_git = true

vim.filetype.add({ extension = { um = "umka" } })

vim.api.nvim_create_autocmd("User", {
  pattern = "TSUpdate",
  callback = function()
    local parsers = require("nvim-treesitter.parsers")
    parsers.umka = {
      install_info = {
        revision = "master",
        url = "https://github.com/urgobalt/tree-sitter-umka",
        files = { "src/parser.c" },
      },
      tier = 2,
    }

    parsers.just = {
      install_info = {
        revision = "main",
        url = "https://github.com/IndianBoy42/tree-sitter-just",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "main",
      },
      tier = 2,
    }
  end,
})

require("nvim-treesitter").setup({
  sync_install = false,
  ensure_installed = {
    "lua",
    "rust",
    "ocaml",
    "c",
    "java",
    "javascript",
    "typescript",
    "html",
    "css",
    "fish",
    "markdown",
    "markdown_inline",
    "zig",
    "nix",
    "blade",
  },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "org" },
  },
  indent = {
    enable = true,
  },
  modules = {},
  ignore_install = {},
})

