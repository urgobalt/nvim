local set = vim.keymap.set

local telescope = require("telescope")
telescope.setup({
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})

telescope.load_extension("fzy_native")

local builtin = require("telescope.builtin")

-- stylua: ignore start
-- Regulat keymaps
set("n", "<leader>tf", builtin.find_files, {desc = "Find files"})
set("n", "<leader>ts", builtin.live_grep, {desc = "Search for a string within the current directory"})
set("n", "<leader>tq", builtin.quickfix, {desc = "List quickfix items"})
set("n", "<leader>tw", builtin.spell_suggest, {desc = "Spell suggestions for current word"})
set("n", "<leader>tr", builtin.resume, {desc = "Reopen the previous window with the same selections and items"})
set("n", "<leader>tb", builtin.buffers, {desc = "List buffers"})
-- Help menus
set("n", "<leader>:", builtin.commands, {desc = "List commands and runs them on <CR>"})
set("n", "<leader>?", builtin.keymaps, {desc = "List keymaps"})
set("n", "<leader>th", builtin.help_tags, {desc = "List help tags"})
-- Configuration
set("n", "<leader>tc", function() builtin.find_files({cwd="$XDG_CONFIG_HOME/nvim"}) end, {desc = "Open file in configuration"})

-- Git specific keymaps
set("n", "<leader>gf", builtin.git_files, {desc = "Find git files"})
set("n", "<leader>gm", builtin.git_status, {desc = "List git modifications"})
set("n", "<leader>gc", builtin.git_commits, {desc = "List git commits"})
set("n", "<leader>gb", builtin.git_branches, {desc = "List and checkout git branch"})

-- stylua: ignore end