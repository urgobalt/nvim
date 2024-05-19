local formatter_bindings = {
	lua = { "stylua" },
	javascript = { "prettier", "prettierd" },
	typescript = { "prettier", "prettierd" },
	go = { "gofmt" },
}

require("conform").setup({
	formatters_by_ft = formatter_bindings,
})

vim.keymap.set("n", "<leader>f", function()
	require("conform").format({})
end)
