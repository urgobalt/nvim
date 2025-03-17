return {
  "willothy/flatten.nvim",
  config = function()
    local flatten = require("flatten")
    flatten.setup()
  end,
  lazy = false,
  priority = 1001,
}
