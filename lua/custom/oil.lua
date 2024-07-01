require("oil").setup({
	default_file_explorer = true,
	columns = {
		"icon",
		-- "permissions",
		-- "size",
		-- "mtime",
	},
	buf_options = {
		buflisted = false,
		bufhidden = "hide",
	},
	win_options = {
		wrap = false,
		signcolumn = "yes",
		cursorcolumn = false,
	},
	delete_to_trash = true,
	lsp_file_methods = {
		timeout_ms = 1000,
		autosave_changes = true,
	},
	contraint_cursor = "editable",
	expreimental_watch_for_changes = true,
	use_default_keymaps = true,
	view_options = {
		show_hidden = true,
		is_always_hidden = function(name, _)
			return name == ".."
		end,
		natural_order = true,
		git = {
			add = function(path)
				return true
			end,
		},
	},
})

vim.keymap.set("n", "-", require("oil").open, { remap = true, desc = "Open file explorer" })

local folder_picker = require("telescope.pickers").new({
	cwd = "/",
	clear = true,
	finder = require("telescope.finders").new_job({ "fd", "--type", "d", "--color", "never" }),
}, {})

vim.keymap.set("n", "<leader>bd", function()
	folder_picker:find()
end, { desc = "Open directory with Oil" })
