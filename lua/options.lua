-- Folding
vim.o.foldenable = false

-- Search settings
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase  = true

-- Indentation
vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 2
vim.opt.expandtab   = true
vim.opt.breakindent = true

-- Timings
vim.opt.updatetime = 250

-- Undo and copy/paste
vim.opt.undofile  = true
vim.opt.clipboard = "unnamedplus"

-- Mouse
vim.opt.completeopt = "menuone,noselect"
vim.opt.mouse       = ""
vim.opt.hlsearch    = false

-- Movement
vim.opt.scrolloff   = 999
vim.opt.jumpoptions = "clean"

-- Netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner       = 0
vim.g.netrw_winsize      = 25

-- TUI
vim.opt.termguicolors = true
vim.opt.conceallevel  = 2
vim.opt.cmdheight     = 1
vim.opt.showmode      = false
vim.opt.showcmd       = false

-- .editorconfig
vim.g.editorconfig = true

-- Remove trailing LF characters
vim.g.noendofline = "binary"
