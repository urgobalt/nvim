require("mini.comment").setup({})
require("mini.move").setup({})
require("mini.align").setup({})
require("mini.ai").setup({})
require("mini.surround").setup({})
require("mini.pairs").setup({})

local bufremove = require("mini.bufremove")
bufremove.setup({ set_vim_settings = true, silent = true })

vim.keymap.set(
  "n",
  "<leader>q",
  bufremove.delete,
  { desc = "Delete current buffer while preserving layout" }
)
