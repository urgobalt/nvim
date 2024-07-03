local set = vim.keymap.set

require("gitsigns").setup({})

-- Git ui
set("n", "<leader>gg", "<cmd>Git<CR>", { desc = "Open fugitive" })
set("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", { desc = "Blame current line" })

-- Stage and reset
set("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
set("n", "<leader>hr", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Reset hunk" })
set("n", "<leader>gs", "<cmd>Git stage %<CR>", { desc = "Stage buffer" })
set("n", "<leader>gr", "<cmd>Git reset %<CR>", { desc = "Reset buffer" })

-- Remote
set("n", "<leader>gc", "<cmd>Git commit<CR>", { desc = "Commit with current staged files" })
set("n", "<leader>gd", "<cmd>Git pull --rebase<CR>", { desc = "Pull down new changes from upstream with rebase flag" })
set("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "Push changes to upstream remote branch" })
set("n", "<leader>gu", "<cmd>Git push -u origin HEAD<CR>", { desc = "Set up current branch upstream" })

-- Telescope
local telescope_builtin = require("telescope.builtin")
set("n", "<leader>gf", telescope_builtin.git_files, { desc = "Find git files" })
set("n", "<leader>gm", telescope_builtin.git_status, { desc = "List git modifications" })
set("n", "<leader>gl", telescope_builtin.git_commits, { desc = "List git commits" })
set("n", "<leader>gk", telescope_builtin.git_branches, { desc = "List and checkout git branch" })
