return {
  "MagicDuck/grug-far.nvim",
  config = function()
    local grug = require("grug-far")
    grug.setup({})
    vim.keymap.set("n", "<leader>/", "<CMD>GrugFar<CR>")
  end,
}
