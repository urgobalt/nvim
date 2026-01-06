local opt = vim.opt
local wo  = vim.wo
local g   = vim.g

-- Remove trailing LF characters
g.noendofline = "binary"

-- Search settings
opt.inccommand = "split"
opt.ignorecase = true
opt.smartcase  = true

-- Indentation
opt.tabstop     = 4
opt.shiftwidth  = 2
opt.expandtab   = true
opt.breakindent = true

-- Timings
opt.updatetime = 250

-- Left column
wo.number         = true
wo.relativenumber = true

-- Undo and copy/paste
opt.undofile  = true
opt.clipboard = "unnamedplus"

-- Mouse
opt.completeopt = "menuone,noselect"
opt.mouse       = ""
opt.hlsearch    = false

-- Movement
opt.scrolloff   = 999
opt.jumpoptions = "clean"

-- Netrw
g.netrw_browse_split = 0
g.netrw_banner       = 0
g.netrw_winsize      = 25

-- TUI
opt.termguicolors = true
opt.conceallevel  = 2
opt.cmdheight     = 1

-- .editorconfig
g.editorconfig = true
