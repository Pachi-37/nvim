local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	vim.notify("nvim-treesitter not found")
	return
end

treesitter.setup({
	-- Install language parser
	-- :TSInstallInfo command show support language
	ensure_installed = { "json", "java", "python", "vim", "lua" },

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	-- Choice
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<TAB>",
		},
	},

	-- indent
	indent = {
		enable = true,
	},
})

-- Folding 
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
