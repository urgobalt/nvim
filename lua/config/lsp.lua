local servers = {
  -- For configuration files
  lua_ls = {
    settings = {
      Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
            path = vim.split(package.path, ";"),
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim", "require" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files and plugins
            library = { vim.env.VIMRUNTIME },
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
      },
    }
  },
  ["nil"] = {
    cmd       = { "nil" },
    filetypes = { "nix" },
  },
  -- Web development
  html          = {},
  cssls         = {},
  ts_ls         = {},
  -- Elixir (because we love it)
  elixirls      = {},
  -- For REAL software development
  rust_analyzer = {},
  clangd        = {},
  zls           = {},
  -- -- EXPERIMENTAL: Orgmode lsp integration
  -- org           = {},
}

-- Apply the configuration to the defined servers
for lsp, configuration in pairs(servers) do
  vim.lsp.enable(lsp)
  vim.lsp.config(lsp, configuration)
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local telescope = require("telescope.builtin")

    -- LSP Actions
    vim.keymap.set(
      "n",
      "<leader>lr",
      vim.lsp.buf.rename,
      { buffer = ev.buf, desc = "Lsp [R]ename Symbol" }
    )
    vim.keymap.set(
      "n",
      "<leader>la",
      vim.lsp.buf.code_action,
      { buffer = ev.buf, desc = "Lsp Code [A]ction" }
    )
    vim.keymap.set("n", "<leader>lq", function()
      vim.lsp.buf.code_action({
        context = { only = { "quickfix" } },
        apply = true,
      })
    end, { buffer = ev.buf, desc = "LSP Code [Q]uickfix" })
    vim.keymap.set("n", "<leader>lI", function()
      vim.lsp.buf.code_action({ context = { only = { "refactor.inline" } } })
    end, { buffer = ev.buf, desc = "LSP [I]nline Code Action" })

    -- Help
    vim.keymap.set(
      "n",
      "<leader>lh",
      vim.lsp.buf.signature_help,
      { buffer = ev.buf, desc = "Signature [H]elp" }
    )

    -- LSP Symbol Resolution
    vim.keymap.set(
      "n",
      "gd",
      telescope.lsp_definitions,
      { buffer = ev.buf, desc = "Goto Definition" }
    )
    vim.keymap.set(
      "n",
      "gr",
      telescope.lsp_references,
      { buffer = ev.buf, desc = "Goto References" }
    )
    vim.keymap.set(
      "n",
      "gI",
      telescope.lsp_implementations,
      { buffer = ev.buf, desc = "Goto Implementation" }
    )
    vim.keymap.set(
      "n",
      "<leader>lD",
      telescope.lsp_type_definitions,
      { buffer = ev.buf, desc = "LSP Type [D]efinition" }
    )
    vim.keymap.set(
      "n",
      "<leader>ls",
      telescope.lsp_document_symbols,
      { buffer = ev.buf, desc = "Document Symbols" }
    )
    vim.keymap.set("n", "<leader>lS", telescope.lsp_workspace_symbols, {
      buffer = ev.buf,
      desc = "Workspace Symbols",
    })
    vim.keymap.set("n", "ge", telescope.diagnostics)
  end
})
