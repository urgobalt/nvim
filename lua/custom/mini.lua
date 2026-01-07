require("mini.comment").setup({})
require("mini.move").setup({})

require("mini.align").setup({
  mappings = {},
  options  = {
    split_pattern   = "",
    justify_side    = "left",
    merge_delimiter = "",
  },
  silent = true,
})

vim.keymap.set("v", "gaw", function()
  local mode
  if vim.api.nvim_get_mode().mode == "v" then
    mode = "char"
  elseif vim.api.nvim_get_mode().mode == "V" then
    mode = "line"
  else
    mode = "block"
  end
  require("mini.align").align_user(mode)
end, { desc = "Align the current selection based on a character or string" })

local ai = require("mini.ai")
local treesitter = ai.gen_spec.treesitter
ai.setup({

  n_lines = 500,
  custom_textobjects = {
    f = treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
    o = treesitter({ a = "@class.outer", i    = "@class.inner" }, {}),
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
