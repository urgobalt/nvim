return {
  "MagicDuck/grug-far.nvim",
  config = function()
    local grug = require("grug-far")
    grug.setup({
      openTargetWindow = {
        preferredLocation = "below",
        useScratchBuffer = true,
      },
      windowCreationCommand = "tab split",
    })
    vim.keymap.set("n", "<leader>/", "<CMD>GrugFar<CR>")
  end,
}
