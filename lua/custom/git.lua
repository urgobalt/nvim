local set = vim.keymap.set

require("gitsigns").setup({})

-- Git ui
set("n", "<leader>ggg", "<cmd>Git<CR>", { desc = "Open fugitive" })
set("n", "<leader>gu", "<cmd>Gitsigns blame_line<CR>", { desc = "Blame current line" })
-- Stage and reset
set("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
set("n", "<leader>hr", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Reset hunk" })
set("n", "<leader>gss", "<cmd>Git stage %<CR>", { desc = "Stage buffer" })
set("n", "<leader>grr", "<cmd>Git reset %<CR>", { desc = "Reset buffer" })
-- Remote
set("n", "<leader>ggc", "<cmd>Git commit<CR>", { desc = "Commit with current staged files" })
set("n", "<leader>ggd", "<cmd>Git pull --rebase<CR>", { desc = "Pull down new changes from upstream with rebase flag" })
set("n", "<leader>ggp", "<cmd>Git push<CR>", { desc = "Push changes to upstream remote branch" })
set("n", "<leader>ggu", "<cmd>Git push -u origin HEAD<CR>", { desc = "Set up current branch upstream" })
