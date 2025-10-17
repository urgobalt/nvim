return {
  "bassamsdata/namu.nvim",
  config = function()
    require("namu").setup({
      global = {},
      namu_symbols = { -- Specific Module options
        options = {},
      },
    })
    vim.keymap.set("n", "<leader>ss", ":Namu symbols<cr>", {
      desc = "Jump to LSP symbol",
      silent = true,
    })
    vim.keymap.set("n", "<leader>sw", ":Namu workspace<cr>", {
      desc = "LSP Symbols - Workspace",
      silent = true,
    })
    vim.keymap.set("n", "<leader>so", ":Namu diagnostics workspace<cr>", {
      desc = "LSP Symbols - Workspace",
      silent = true,
    })
  end,
}
