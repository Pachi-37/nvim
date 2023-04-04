local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("Installing Pakcer.nvim，waiting...")
  paccker_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    -- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
    install_path,
  })

  -- https://github.com/wbthomason/packer.nvim/issues/750
  local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Pakcer.nvim install successfully.")
end

local packer = require("packer")
--if not status_ok then
--  vim.notify("packer.nvim not found.")
--  return
--end

packer.startup({
  function(use)
    use 'wbthomason/packer.nvim'

    -- schemes
    use("folke/tokyonight.nvim")
    use("shaunsingh/nord.nvim")
    use("ful1e5/onedark.nvim")
    use("EdenEast/nightfox.nvim")

    -- nvim-tree 
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

    -- lualine
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")

    -- telescope Use this command :checkhealth telescope 
    -- This plugin relies on the following two commands (ripgrep, fd)
    -- sudo add-apt-repository ppa:x4121/ripgrep
    -- sudo apt-get update
    -- sudo apt install ripgrep
    -- sudo apt-get install fd-find
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }

    -- treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		
		-- LSP
		-- installer
		use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
		-- config
		use({ "neovim/nvim-lspconfig" })
    
    -- Autocomplete
		-- completion engine
		use("hrsh7th/nvim-cmp")
		-- snippet engine
		use("hrsh7th/vim-vsnip")
		-- source
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
		use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
		use("hrsh7th/cmp-path") -- { name = 'path' }
		use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
		-- common language code snippets
		use("rafamadriz/friendly-snippets")
    -- ui
    use("onsails/lspkind-nvim")
    -- indent blanckLine
    use("lukas-reineke/indent-blankline.nvim")
		if paccker_bootstrap then
      packer.sync()
    end
  end,
  config = {
    max_jobs = 16,
    git = {
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
    },
  },
})
