-- Dependencies
vim.pack.add({
  -- General Graphical Dependency
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  -- For Colorscheme
  { src = "https://github.com/rktjmp/lush.nvim" },
})

-- Plugins
vim.pack.add({
  -- Theme
  { src = "https://github.com/zenbones-theme/zenbones.nvim" },
  { src = "https://github.com/xiyaowong/transparent.nvim" },

  -- Development Environment
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/nvim-mini/mini.nvim" },
  { src = "https://github.com/windwp/nvim-autopairs" },
  { src = "https://github.com/luukvbaal/statuscol.nvim" },

  -- Completion
  { src = "https://github.com/Saghen/blink.cmp", version = "v1" },
  { src = "https://github.com/mikavilpas/blink-ripgrep.nvim" },

  -- File Explorer
  { src = "https://github.com/stevearc/oil.nvim" },

  -- Navigation
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/folke/flash.nvim" },

  -- Convenience Plugins
  { src = "https://github.com/yutkat/confirm-quit.nvim" },
  { src = "https://github.com/pogyomo/winresize.nvim" },
  { src = "https://github.com/folke/todo-comments.nvim" },
})

vim.g.mapleader = " "

-- Development Environment
require("config/treesitter")
require("config/lsp")
require("config/autoclose")
require("config/align")
require("config/mini")
require("config/signcolumn")

-- Completion
require("config/completion")

-- File Explorer
require("config/file-explorer")

-- Navigation
require("config/navigation")

-- Convenience
require("config/todo")

-- OPTIONS

-- Colorscheme
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd([[colorscheme forestbones]])

require("transparent").setup({
  extra_groups = {
    "NormalFloat",
    "FloatBorder",
    "TelescopeNormal",
    "TelescopeBorder",
    "TelescopePromptBorder",
    "FoldColumn",
  },
})

-- Clipboard
vim.o.clipboard = "unnamedplus"

-- Buffer/Windows actions
vim.keymap.set("n", "<leader>w", "<CMD>w<CR>",                         { desc = "Write active buffer to file" })
vim.keymap.set("n", "<leader>q", require("confirm-quit").confirm_quit, { desc = "Quit current window"         })

-- Windows navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window split"  })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window split below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window split above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window split" })

-- Windows resize
vim.keymap.set("n", "<C-A-h>", function() require("winresize").resize(0, 5, "left")  end)
vim.keymap.set("n", "<C-A-j>", function() require("winresize").resize(0, 2, "down")  end)
vim.keymap.set("n", "<C-A-k>", function() require("winresize").resize(0, 2, "up")    end)
vim.keymap.set("n", "<C-A-l>", function() require("winresize").resize(0, 5, "right") end)

-- Ctrl+Backspace support
vim.keymap.set("i", "<C-BS>", "<C-W>")

vim.api.nvim_create_user_command("PackUpdate", function()
  vim.pack.update(nil, {force = true})
end, {})
