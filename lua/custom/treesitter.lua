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
