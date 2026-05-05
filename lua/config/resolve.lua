require("resolve").setup({
  default_keymaps = false,
  -- Conflict marker patterns (Lua patterns, must match from start of line)
  markers = {
    ours = "^<<<<<<<+",      -- Start of "ours" section
    theirs = "^>>>>>>>+",    -- End of "theirs" section
    ancestor = "^|||||||+",  -- Start of ancestor/base section (diff3)
    separator = "^=======+$", -- Separator between sections
  },
  -- Callback function called when conflicts are detected
  -- Receives: { bufnr = number, conflicts = table }
  on_conflict_detected = function(input)
    vim.keymap.set("n", "n", "<CMD>ResolveNext<CR>", { desc = "Go to the next conflict marker", buf = input.bufnr })
  end,
  -- Callback function called when all conflicts are resolved
  -- Receives: { bufnr = number }
  on_conflicts_resolved = function(input)
    pcall(vim.keymap.del, "n", "n", { buf = input.bufnr })
  end,
})

vim.keymap.set("n", "<leader>co", "<CMD>ResolveOurs<CR>",        { desc = "Resolve our side" })
vim.keymap.set("n", "<leader>ct", "<CMD>ResolveTheirs<CR>",      { desc = "Resolve their side" })
vim.keymap.set("n", "<leader>ca", "<CMD>ResolveBoth<CR>",        { desc = "Resolve both sides" })
vim.keymap.set("n", "<leader>cr", "<CMD>ResolveBothReverse<CR>", { desc = "Resolve both sides reversed" })
vim.keymap.set("n", "<leader>cb", "<CMD>ResolveBase<CR>",        { desc = "Resolve base" })
vim.keymap.set("n", "<leader>cd", "<CMD>ResolveNone<CR>",        { desc = "Resolve no side" })
