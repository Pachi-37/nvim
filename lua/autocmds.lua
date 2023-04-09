local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
augroup('AutocmdConfig', { clear = true })
autocmd('TextYankPost', {
  group = 'AutocmdConfig',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})

-- Remove whitespace on save
autocmd('BufWritePre', {
		group = 'AutocmdConfig',
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- Enter Terminal to enter insert mode
autocmd("TermOpen", {
  group = 'AutocmdConfig',
  command = "startinsert",
})

-- Don't auto commenting new lines
autocmd("BufEnter", {
    group = 'AutocmdConfig',
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
      - "o" -- O and o, don't continue comments
      + "r" -- But do continue when pressing enter.
  end,
})

-- Go back last edit location
autocmd("BufReadPost",{
    group = 'AutocmdConfig',
  pattern = '*',
  command = "normal! g'\"",
})
