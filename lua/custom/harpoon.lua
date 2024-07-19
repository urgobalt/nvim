local harpoon = require("harpoon")

harpoon:setup({})

vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end, { desc = "Add file to marks" })

vim.keymap.set("n", "<leader>he", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Toggle quick menu" })

-- stylua: ignore start
-- Normal
vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, {desc="Open mark 1"})
vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, {desc="Open mark 2"})
vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, {desc="Open mark 3"})
vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, {desc="Open mark 4"})
vim.keymap.set("n", "<leader>h5", function() harpoon:list():select(5) end, {desc="Open mark 5"})
vim.keymap.set("n", "<leader>h6", function() harpoon:list():select(6) end, {desc="Open mark 6"})

-- Terminal
vim.keymap.set("t", "<M-1>", function() harpoon:list():select(1) end, {desc="Open mark 1"})
vim.keymap.set("t", "<M-2>", function() harpoon:list():select(2) end, {desc="Open mark 2"})
vim.keymap.set("t", "<M-3>", function() harpoon:list():select(3) end, {desc="Open mark 3"})
vim.keymap.set("t", "<M-4>", function() harpoon:list():select(4) end, {desc="Open mark 4"})
vim.keymap.set("t", "<M-5>", function() harpoon:list():select(5) end, {desc="Open mark 5"})
vim.keymap.set("t", "<M-6>", function() harpoon:list():select(6) end, {desc="Open mark 6"})
-- stylua: ignore end
