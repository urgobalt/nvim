local servers = {
	tsserver = {},
	rust_analyzer = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
	astro = {},
	clangd = {},
	gopls = {},
	htmx = {},
	rnix = {},
	ocamllsp = {},
	intelephense = {},
	taplo = {},
	tailwindcss = {},
	zls = {},
	jsonls = {},
	gleam = {},
}

require("neodev").setup({
	pathStrict = true,
})

local on_attach = function(_, bufnr)
	local telescope = require("telescope.builtin")

	-- Buffer Update
	vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = bufnr, desc = "Lsp [R]ename Symbol" })
	vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Lsp Code [A]ction" })
	vim.keymap.set("n", "<leader>lq", function()
		vim.lsp.buf.code_action({ context = { only = { "quickfix" } } })
	end, { buffer = bufnr, desc = "LSP Code [Q]uickfix" })
	vim.keymap.set("n", "<leader>lI", function()
		vim.lsp.buf.code_action({ context = { only = { "refactor.inline" } } })
	end, { buffer = bufnr, desc = "LSP [I]nline Code Action" })

	-- Help
	vim.keymap.set("n", "<leader>lh", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature [H]elp" })

	-- Telescope
	vim.keymap.set("n", "gd", telescope.lsp_definitions, { buffer = bufnr, desc = "Goto Definition" })
	vim.keymap.set("n", "gr", telescope.lsp_references, { buffer = bufnr, desc = "Goto References" })
	vim.keymap.set("n", "gI", telescope.lsp_implementations, { buffer = bufnr, desc = "Goto Implementation" })
	vim.keymap.set(
		"n",
		"<leader>lD",
		telescope.lsp_type_definitions,
		{ buffer = bufnr, desc = "LSP Type [D]efinition" }
	)
	vim.keymap.set("n", "<leader>ls", telescope.lsp_document_symbols, { buffer = bufnr, desc = "Document Symbols" })
	vim.keymap.set("n", "<leader>lS", telescope.lsp_workspace_symbols, {
		buffer = bufnr,
		desc = "Workspace Symbols",
	})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

for key, settings in pairs(servers) do
	require("lspconfig")[key].setup({ settings = settings, on_attach = on_attach })
end
