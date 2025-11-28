local npairs = require("nvim-autopairs")

local rule = require("nvim-autopairs.rule")
local conditions = require("nvim-autopairs.conds")

npairs.setup({
  check_ts = true,
  ts_config = {
    -- lua = {'string'} -- do not add a pair to that treesitter node
  },
})
