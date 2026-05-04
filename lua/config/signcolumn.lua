local builtin = require("statuscol.builtin")

vim.o.number = true
vim.o.relativenumber = true

vim.diagnostic.config({
  virtual_text = true,
  underline = false,
  severity_sort = true,
  signs = {
    active = true,
    text = {
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.ERROR] = " ",
    },
  },
})

require("statuscol").setup({
  relculright = true,
  setopt = true,
  thousands = "_",
  segments = {
    -- FIX: This does not show folds currently, discover why
    {
      text = { builtin.foldfunc },
    },
    {
      text = { " ", "%s" },
      sign = {
        namespace = { "diagnostic" },
        fillcharhl = "SignColumn",
        maxwidth = 2,
        colwidth = 2,
        auto = false,
        foldclosed = true,
      },
      hl = "SignColumn",
    },
    -- TODO: Remove if DAP is never implemented
    {
      sign = {
        name = {
          "DAP",
          "neotest",
        },
        maxwidth = 2,
        colwidth = 2,
        auto = true,
      },
    },
    {
      text = { builtin.lnumfunc, " " },
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
  bt_ignore = { "nofile" },
})
