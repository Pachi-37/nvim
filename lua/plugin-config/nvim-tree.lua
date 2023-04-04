local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("nvim-tree no found")
  return
end

local list_keys = require('keybindings').nvimTreeList
nvim_tree.setup({
    
		-- don't show git status item
    git = {
        enable = false,
    },

		-- project plug setting
		update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },

		-- hide .file and node_module folders
		filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },

		-- nvim-tree size
		view = {
        width = 40,
        side = 'left',
        hide_root_folder = false,
        mappings = {
            custom_only = false,
            list = list_keys,
        },
        number = false,
        relativenumber = false,
        signcolumn = 'yes',
    },

		actions = {
        open_file = {
            resize_window = true,
            quit_on_open = true,
        },
    },
		
		system_open = {
        cmd = 'wsl-open', -- other open
				-- If you want to open files with Windows system default settings in WSL, you need to install a wsl-open package globally with Node.js
				-- npm install -g wsl-open
    },
})

vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
