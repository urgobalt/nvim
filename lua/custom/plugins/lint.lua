return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      astro = { "eslint_d" },
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
      pattern = "*",
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
