local servers = {
  -- For configuration files
  lua_ls = {
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
  },
  nixd          = {},
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
}

local on_attach = function(on_attach)
  return function(client, bufnr)
    local telescope = require("telescope.builtin")

    -- LSP Actions
    vim.keymap.set(
      "n",
      "<leader>lr",
      vim.lsp.buf.rename,
      { buffer = bufnr, desc = "Lsp [R]ename Symbol" }
    )
    vim.keymap.set(
      "n",
      "<leader>la",
      vim.lsp.buf.code_action,
      { buffer = bufnr, desc = "Lsp Code [A]ction" }
    )
    vim.keymap.set("n", "<leader>lq", function()
      vim.lsp.buf.code_action({
        context = { only = { "quickfix" } },
        apply = true,
      })
    end, { buffer = bufnr, desc = "LSP Code [Q]uickfix" })
    vim.keymap.set("n", "<leader>lI", function()
      vim.lsp.buf.code_action({ context = { only = { "refactor.inline" } } })
    end, { buffer = bufnr, desc = "LSP [I]nline Code Action" })

    -- Help
    vim.keymap.set(
      "n",
      "<leader>lh",
      vim.lsp.buf.signature_help,
      { buffer = bufnr, desc = "Signature [H]elp" }
    )

    -- LSP Symbol Resolution
    vim.keymap.set(
      "n",
      "gd",
      telescope.lsp_definitions,
      { buffer = bufnr, desc = "Goto Definition" }
    )
    vim.keymap.set(
      "n",
      "gr",
      telescope.lsp_references,
      { buffer = bufnr, desc = "Goto References" }
    )
    vim.keymap.set(
      "n",
      "gI",
      telescope.lsp_implementations,
      { buffer = bufnr, desc = "Goto Implementation" }
    )
    vim.keymap.set(
      "n",
      "<leader>lD",
      telescope.lsp_type_definitions,
      { buffer = bufnr, desc = "LSP Type [D]efinition" }
    )
    vim.keymap.set(
      "n",
      "<leader>ls",
      telescope.lsp_document_symbols,
      { buffer = bufnr, desc = "Document Symbols" }
    )
    vim.keymap.set("n", "<leader>lS", telescope.lsp_workspace_symbols, {
      buffer = bufnr,
      desc = "Workspace Symbols",
    })
    vim.keymap.set("n", "ge", telescope.diagnostics)

    if on_attach ~= nil then
      on_attach(client, bufnr)
    end
  end
end

-- Apply the configuration to the defined servers
for lsp, settings in pairs(servers) do
  vim.lsp.enable(lsp)
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    settings = settings,
  })
end
