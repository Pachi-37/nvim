-- Basic Setting
require('basic')
require('keybindings')
require('plugins')
require("colorscheme")

-- Plugin
require("plugin-config.nvim-tree")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.nvim-treesitter")

-- lsp config
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")

-- index line
require("plugin-config.indent-blankline")

-- autocmd
require("autocmds")
