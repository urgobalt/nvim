local telescope = require("telescope")
telescope.setup({
  defaults = {
    initial_mode = "normal",
  },
  extensions = {
    repo = {
      list = {
        search_dirs = { "~/projects" },
        tail_path = false,
        fd_opts = { "--prune" },
        cwd = vim.fn.expand("$HOME/projects"),
      },
    },
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
})

telescope.load_extension("repo")
telescope.load_extension("fzy_native")
telescope.load_extension("conflicts")

local builtin = require("telescope.builtin")

-- stylua: ignore start

-- Regular keymaps
vim.keymap.set("n", "<leader>tf", builtin.find_files,    {desc = "Find files"})
vim.keymap.set("n", "<leader>tq", builtin.quickfix,      {desc = "List quickfix items"})
vim.keymap.set("n", "<leader>tw", builtin.spell_suggest, {desc = "Spell suggestions for current word"})
vim.keymap.set("n", "<leader>tr", builtin.resume,        {desc = "Reopen the previous window with the same selections and items"})
vim.keymap.set("n", "<leader>tb", builtin.buffers,       {desc = "List buffers"})

vim.keymap.set({ "n", "v" }, "<leader>ts", function()
  local word
  if vim.fn.mode() == "v" then
    local saved_reg = vim.fn.getreg "v"
    vim.cmd [[noautocmd sil norm! "vy]]
    local sele = vim.fn.getreg "v"
    vim.fn.setreg("v", saved_reg)
    word = sele
  else
    word = vim.fn.expand("<cword>")
  end

  builtin.live_grep( {
      default_text = word,
      regex = true,
  })
end,                                                     {desc = "Search for a string within the current directory"})

-- Help menus
vim.keymap.set("n", "<leader>:",  builtin.commands,      {desc = "List commands and runs them on <CR>"})
vim.keymap.set("n", "<leader>?",  builtin.keymaps,       {desc = "List keymaps"})
vim.keymap.set("n", "<leader>th", builtin.help_tags,     {desc = "List help tags"})

-- Conflicts
vim.keymap.set("n", "<leader>tc", "<cmd>Telescope conflicts<cr>", {desc = "List conflicts in the repo"})

-- Repo
vim.keymap.set("n", "<leader>tp", function() telescope.extensions.repo.list({}) end, {desc="Open file in project"})

-- CmdLine
-- vim.keymap.set("n", ":", "<CMD>Telescope cmdline<CR>", {desc="CmdLine"})

vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>", {desc = "Search through all project todos"})

-- stylua: ignore end
