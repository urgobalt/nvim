local on_attach = function(on_attach)
	return function(client, bufnr)
		local telescope = require("telescope.builtin")

		-- Buffer Update
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = bufnr, desc = "Lsp [R]ename Symbol" })
		vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Lsp Code [A]ction" })
		vim.keymap.set("n", "<leader>lq", function()
			vim.lsp.buf.code_action({ context = { only = { "quickfix" } }, apply = true })
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

		if on_attach ~= nil then
			on_attach(client, bufnr)
		end
	end
end

local lsp = require("lspconfig")
local servers = {
	ts_ls = {},
	rust_analyzer = {
		on_attach = function(_, bufnr)
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end,
		settings = {
			["rust-analyzer"] = {
				imports = {
					granularity = {
						group = "module",
					},
					prefix = "self",
				},
				cargo = {
					buildScripts = {
						enable = true,
					},
				},
				procMacro = {
					enable = true,
				},
			},
		},
	},
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
	clangd = {
		cmd = (function()
			local cmd = { "clangd" }
			local isystem = os.getenv("CC")

			if isystem ~= nil and isystem ~= "" then
				cmd[#cmd + 1] = "--query-driver=" .. isystem
			end

			return cmd
		end)(),
	},
	gopls = {},
	-- htmx = {},
	["nil"] = {},
	ocamllsp = {},
	intelephense = {
		settings = {
			-- stylua: ignore start
			stubs = {
				"apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl", "date",
				"dba", "dom", "enchant", "exif", "FFI", "fileinfo", "filter", "fpm", "ftp", "gd", "gettext",
				"gmp", "hash", "iconv", "imap", "intl", "json", "ldap", "libxml", "mbstring", "meta", "mysqli",
				"oci8", "odbc", "openssl", "pcntl", "pcre", "PDO", "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql",
				"Phar", "posix", "pspell", "readline", "Reflection", "session", "shmop", "SimpleXML", "snmp", "soap",
				"sockets", "sodium", "SPL", "sqlite3", "standard", "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy",
				"tokenizer", "xml", "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib",
				"wordpress", "phpunit",
			},
			-- stylua: ignore end
			diagnostics = {
				enable = true,
			},
		},
		root_dir = lsp.util.root_pattern("wp-includes"),
	},
	taplo = {},
	tailwindcss = {},
	zls = {},
	jsonls = {},
	gleam = {},
	elixirls = {
		cmd = { "elixir-ls" },
	},
	-- ruff = {
	-- 	cmd = { "ruff", "--preview" },
	-- },
	-- pylyzer = {},
	-- jedi_language_server = {},
	pylsp = {},
	htmx = {},
	html = {},
	emmet_ls = {},
}

require("neodev").setup({
	override = function(_, library)
		library.enabled = true
		library.plugins = true
	end,
	pathStrict = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

local configs = require("lspconfig.configs")

-- Custom servers
if not configs["nil"] then
	configs["nil"] = {
		default_config = {
			cmd = { "nil" },
			filetypes = { "nix" },
			name = "nil",
			root_dir = lsp.util.root_pattern("flake.nix", "configuration.nix"),
			settings = {},
		},
	}
end

for key, setup in pairs(servers) do
	local custom_attach = setup.on_attach
	setup.on_attach = on_attach(custom_attach)

	setup.capabilities = capabilities

	lsp[key].setup(setup)
end
