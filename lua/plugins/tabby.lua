return {
  {
    "nanozuki/tabby.nvim",
    config = function()
      require("tabby").setup({
        line = function(line)
          return {
            line.tabs().foreach(function(tab)
              return {
                line.sep(" ", "TabLine", "TabLine"),
                tab.is_current() and "" or "",
                tab.name(),
                hl = "TabLine",
                margin = " ",
              }
            end),
          }
        end,
      })
    end,
  },
}
