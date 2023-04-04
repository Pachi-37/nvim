--[[
--   Used class:
--   vim.g.{name} global variable
--   vim.b.{name} buffer variable
--   vim.w.{name} window variable
--   vim.bo.{option} buffer-local option
--   vim.wo.{option} window-local option
--]]


-- style
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true

-- utf8
vim.g.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'

-- Keep 8 line around the cursor when moving
crolloff = 8
vim.o.sidescrolloff = 8

-- Use relative line number
vim.wo.number = true
vim.wo.relativenumber = true

-- Highlight the row
vim.wo.cursorline = true

vim.wo.signcolumn = 'yes'

-- Reference line(The code is too long)
vim.wo.colorcolumn = '100'

-- Indent
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.expandtab = true
vim.bo.expandtab = true

-- The new row aligns the current row
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true

-- Cmd
vim.o.cmdheight = 2

-- File synchronization
vim.o.autoread = true
vim.bo.autoread = true

-- Line wrapping is prohibited
vim.wo.wrap = false

-- The cursor moves across lines
vim.o.whichwrap = "<,>,[,]"

-- hidden buffer(duplicate buffer need)
vim.o.hidden = true

-- Support mouse
vim.o.mouse = "a"

-- Create backup files
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- Display invisible characters
vim.o.list = false
vim.o.listchars = "space:."

-- Complement enhancements
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
-- complement lines
vim.o.pumheight = 10
-- display tabline
vim.o.showtabline = 2
-- No longer requires vim's mode prompts if use plugin
vim.o.showmode = false
-- Autocomplete exclusions
vim.g.completeopt = "menu,menuone,noselect,noinsert"
