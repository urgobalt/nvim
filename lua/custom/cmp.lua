vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }
vim.opt.shortmess:append("c")

local lspkind = require("lspkind")
lspkind.init({})

local cmp = require("cmp")

function not_in_comments()
	-- disable completion in comments
	local context = require("cmp.config.context")
	-- keep command mode completion enabled when cursor is in a comment
	if vim.api.nvim_get_mode().mode == "c" then
		return true
	else
		return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
	end
end

cmp.setup({
	enabled = true,
	sources = {
		{ name = "nvim_lsp", priority = 10 },
		{ name = "path", priority = 8 },
		{ name = "luasnip", priority = 4 },
		{ name = "buffer", priority = 1 },
	},
	mapping = {
		["<c-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }, { "i", "c" }),
		["<c-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }, { "i", "c" }),
		["<c-y>"] = cmp.mapping(
			cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}),
			{ "i", "c" }
		),
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	completion = {
		autocomplete = {
			cmp.TriggerEvent.TextChanged,
			cmp.TriggerEvent.InsertEnter,
		},
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		expandable_indicator = true,
		format = function(entry, item)
			local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
			item = require("lspkind").cmp_format({
				-- any lspkind format settings here
			})(entry, item)
			if color_item.abbr_hl_group then
				item.kind_hl_group = color_item.abbr_hl_group
				item.kind = color_item.abbr
			end
			return item
		end,
	},
})

cmp.setup.filetype({ "sql" }, {
	sources = {
		{ name = "vim-dadbod-completion" },
		{ name = "buffer" },
	},
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "cmdline", priority = 10 },
		{ name = "path", priority = 5 },
		{ name = "buffer", priority = 1 },
	}, {
		{
			name = "cmdline",
			option = {
				ignore_cmds = { "Man", "!" },
			},
		},
	}),
})

local ls = require("luasnip")
ls.config.set_config({
	history = false,
	updateevents = "TextChanged,TextChangedI",
})

vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
