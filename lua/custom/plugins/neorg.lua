return {
  {
    "nvim-neorg/neorg",
    enabled = false,
    build = ":Neorg sync-parsers",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("custom.neorg")
    end,
  },
}
