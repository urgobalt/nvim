return {
  "patrickpichler/hovercraft.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  config = function()
    require("hovercraft").setup({
      providers = {
        providers = {
          {
            "LSP",
            require("hovercraft.provider.lsp.hover").new(),
          },
          {
            "Man",
            require("hovercraft.provider.man").new(),
          },
          {
            "Dictionary",
            require("hovercraft.provider.dictionary").new(),
          },
        },
      },

      window = {
        border = "rounded",

        -- enable this if you are a user of the MeanderingProgrammer/render-markdown.nvim plugin
        -- render_markdown_compat_mode = true,
      },
      keys = {
        {
          "<TAB>",
          function()
            require("hovercraft").hover_next()
          end,
        },
        {
          "<S-TAB>",
          function()
            require("hovercraft").hover_next({ step = -1 })
          end,
        },
      },
    })

    -- Setup keymaps
    vim.keymap.set("n", "K", function()
      local hovercraft = require("hovercraft")

      if hovercraft.is_visible() then
        hovercraft.enter_popup()
      else
        hovercraft.hover()
      end
    end, { desc = "Hover" })
  end,
}
