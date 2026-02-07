require("mini.comment").setup({})
require("mini.move").setup({})

-- require("mini.align").setup({
--   mappings = {
--     start              = nil,
--     start_with_preview = "ga",
--   },
--   options = {
--     split_pattern = "=",
--     justify_side  = "left",
--   },
-- })

local ai = require("mini.ai")
local treesitter = ai.gen_spec.treesitter
ai.setup({

  n_lines = 500,
  custom_textobjects = {
    f = treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
    o = treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
    c = ai.gen_spec.function_call(),
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
