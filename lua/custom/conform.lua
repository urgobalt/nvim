local formatter_bindings = {
  lua = { "stylua" },
  javascript = { "prettier", "prettierd" },
  typescript = { "prettier", "prettierd" },
  css = { "prettier", "prettierd" },
  heex = { "prettier", "prettierd" },
  go = { "gofmt" },
  nix = { "alejandra" },
}

require("conform").setup({
  formatters_by_ft = formatter_bindings,
})

vim.keymap.set("n", "<leader>f", function()
  require("conform").format({
    lsp_fallback = true,
  })
end, { desc = "Format buffer 0" })
