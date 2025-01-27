local opt = vim.opt
local wo = vim.wo
local g = vim.g

-- Remove trailing LF characters
g.noendofline = "binary"

-- Search settings
opt.inccommand = "split"
opt.ignorecase = true
opt.smartcase = true

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 2
opt.expandtab = true
opt.breakindent = true

-- Timings
opt.updatetime = 250

-- Left column
wo.number = true
wo.relativenumber = true
-- wo.signcolumn = "yes"

-- Undo and copy/paste
opt.undofile = true
opt.clipboard = "unnamedplus"

-- Mouse
opt.completeopt = "menuone,noselect"
opt.mouse = ""
opt.hlsearch = false

-- Movement
opt.scrolloff = 999
opt.jumpoptions = "stack"

-- Netrw
g.netrw_browse_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25

-- TUI
opt.termguicolors = true
-- opt.colorcolumn = "80,120"
opt.conceallevel = 2
opt.cmdheight = 1

-- Folding
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldenable = false
