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

local servers = {
	tsserver = {},
	rust_analyzer = {},
	lua_ls = {
		settings = {
			Lua = {
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
				completion = {
					callSnippet = "Replace",
				},
			},
		},
	},
	astro = {},
	clangd = {},
	gopls = {},
	htmx = {},
	["nil"] = {},
	ocamllsp = {},
	intelephense = {},
	taplo = {},
	tailwindcss = {},
	zls = {},
	jsonls = {},
	gleam = {},
	elixirls = {
		cmd = { "elixir-ls" },
	},
}

require("neodev").setup({
	override = function(_, library)
		library.enabled = true
		library.plugins = true
	end,
	pathStrict = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local lsp = require("lspconfig")
local configs = require("lspconfig.configs")

-- Custom servers
if not configs["nil"] then
	configs["nil"] = {
		default_config = {
			cmd = { "nil" },
			filetypes = { "nix" },
			name = "nil",
			root_dir = lsp.util.root_pattern("configuration.nix", "flake.nix"),
			settings = {},
		},
	}
end

for key, setup in pairs(servers) do
	if setup.on_attach == nil then
		setup.on_attach = on_attach
	end
	setup.capabilities = capabilities

	lsp[key].setup(setup)
end
