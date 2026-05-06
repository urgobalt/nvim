-- Comment Management
require("mini.comment").setup()

-- Line movement keybinds
require("mini.move").setup({})

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

require("mini.statusline").setup()
