return {
  "stevearc/conform.nvim",
  enabled = false,
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    require("custom.conform")
  end,
}
