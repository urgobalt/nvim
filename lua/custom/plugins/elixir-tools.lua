return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local elixir = require("elixir")
    local elixirls = require("elixir.elixirls")

    elixir.setup({
      nextls = { enable = false },
      credo = { enable = true },
      elixirls = {
        enable = true,
        cmd = "elixir-ls",
        settings = elixirls.settings({
          dialyzerEnabled = false,
          enableTestLenses = false,
        }),
        on_attach = function(_, _)
          vim.keymap.set(
            "n",
            "<leader>ef",
            ":ElixirFromPipe<cr>",
            { buffer = true, noremap = true }
          )
          vim.keymap.set(
            "n",
            "<leader>ep",
            ":ElixirToPipe<cr>",
            { buffer = true, noremap = true }
          )
          vim.keymap.set(
            "v",
            "<leader>em",
            ":ElixirExpandMacro<cr>",
            { buffer = true, noremap = true }
          )
        end,
      },
    })
  end,
}
