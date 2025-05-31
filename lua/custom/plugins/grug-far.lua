return {
  "MagicDuck/grug-far.nvim",
  config = function()
    vim.g.maplocalleader = "<Space><Space>"
    local grug = require("grug-far")
    grug.setup({})
    vim.keymap.set("n", "<leader>/", "<CMD>GrugFar<CR>")
  end,
}
