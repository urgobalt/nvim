local builtin = require("statuscol.builtin")
function hello(hello) end
require("statuscol").setup({
  relculright = true,
  setopt = true,
  segments = {
    {
      sign = {
        namespace = {
          "vim_lsp_references",
          "vim_lsp_semantic_tokens",
          "vim_lsp_inlayhint",
        },
        maxwidth = 3,
        colwidth = 1,
        auto = false,
        fillChar = "~",
      },
    },
    {
      sign = {
        name = {
          "Dap",
          "neotest",
        },
        maxwidth = 2,
        colwidth = 2,
        auto = true,
      },
    },
    {
      sign = {
        namespace = { "gitsign" },
        maxwidth = 1,
        colwidth = 1,
        auto = false,
        fillchar = " ",
        fillcharhl = "StatusColumnSeparator",
      },
    },
    {
      text = { "%C ", builtin.lnumfunc, " " },
    },
  },
  ft_ignore = {
    "help",
    "vim",
    "fugitive",
    "alpha",
    "dashboard",
    "neo-tree",
    "Trouble",
    "noice",
    "lazy",
    "toggleterm",
  },
})
