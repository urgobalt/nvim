return {
  "luukvbaal/statuscol.nvim",
  event = { "BufNewFile", "BufReadPre", "BufEnter" },
  config = function()
    require("custom.statuscol")
  end,
}
