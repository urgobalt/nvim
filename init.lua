load_start_time = os.clock()

-- Dependencies
vim.pack.add({
  -- General Graphical Dependency
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  -- For Colorscheme
  { src = "https://github.com/rktjmp/lush.nvim" },
  -- For Dashboard
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

-- Plugins
vim.pack.add({
  -- Theme
  { src = "https://github.com/zenbones-theme/zenbones.nvim" },
  { src = "https://github.com/xiyaowong/transparent.nvim" },

  -- Development Environment
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/klen/nvim-config-local" },
  { src = "https://github.com/luukvbaal/statuscol.nvim" },
  { src = "https://github.com/sitiom/nvim-numbertoggle" },

  -- Editing Enhancement
  { src = "https://github.com/nvim-mini/mini.nvim" },
  { src = "https://github.com/windwp/nvim-autopairs" },
  { src = "https://github.com/kylechui/nvim-surround" },
  { src = "https://github.com/ankushbhagats/match.nvim" },

  -- Meta development
  { src = "https://github.com/folke/todo-comments.nvim" },
  { src = "https://github.com/spacedentist/resolve.nvim" },

  -- Completion
  { src = "https://github.com/Saghen/blink.cmp", version = "v1" },
  { src = "https://github.com/mikavilpas/blink-ripgrep.nvim" },

  -- File Explorer
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/airblade/vim-rooter" },

  -- Navigation
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/folke/flash.nvim" },

  -- Convenience Plugins
  { src = "https://github.com/yutkat/confirm-quit.nvim" },
  { src = "https://github.com/pogyomo/winresize.nvim" },
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
  { src = "https://github.com/nvimdev/dashboard-nvim" },

  -- Optimization
  { src = "https://github.com/LunarVim/bigfile.nvim" },
})

vim.g.mapleader = " "

-- Development Environment
require("config/treesitter")
require("config/lsp")
require("config/signcolumn") -- statuscol

-- Editing Enhancement
require("config/autoclose")
require("config/align")
require("config/mini")
require("config/surround")
require("config/match")

-- Meta development
require("config/todo")
require("config/resolve")

-- Completion
require("config/completion")

-- File Explorer
require("config/file-explorer")

-- Navigation
require("config/navigation")

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

-- Indentation guides
require('ibl').setup({
  exclude = {
    filetypes = { "dashboard" },
  },
  scope = { enabled = false },
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

require('config-local').setup {
  config_files = { ".nvim.lua", ".nvimrc", ".exrc" },

  autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
  commands_create = true,     -- Create commands (ConfigLocalSource, ConfigLocalEdit, ConfigLocalTrust, ConfigLocalDeny)
  silent = false,             -- Disable plugin messages (Config loaded/denied)
  lookup_parents = false,     -- Lookup config files in parent directories
}

require("autocmd")

startup_time = os.clock() - load_start_time

-- Dashboard
require("config/dashboard")
