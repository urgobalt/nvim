require("mini.comment").setup({})
require("mini.move").setup({})
require("mini.align").setup({})
-- require("mini.surround").setup({})
require("mini.pairs").setup({})
local ai = require("mini.ai")
local treesitter = ai.gen_spec.treesitter
ai.setup({

  n_lines = 500,
  custom_textobjects = {
    f = treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
    c = treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
  },
})

local bufremove = require("mini.bufremove")
bufremove.setup({ set_vim_settings = true, silent = true })

vim.keymap.set(
  "n",
  "<leader>q",
  bufremove.delete,
  { desc = "Delete current buffer while preserving layout" }
)
