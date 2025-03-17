require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.configs").setup({
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
  },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  modules = {},
  ignore_install = {},
})
