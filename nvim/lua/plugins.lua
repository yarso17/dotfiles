local status, packer = pcall(require, 'packer')
if (not status) then
  print('Packer is not installed')
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- Using Packer
  use 'wbthomason/packer.nvim'

  -- Themes
  -- use 'folke/tokyonight.nvim'

  -- onedarkpro
  use "olimorris/onedarkpro.nvim"
  --
  -- neosolarized
  -- use {
  --   'svrana/neosolarized.nvim',
  --   requires = { 'tjdevries/colorbuddy.nvim' }
  -- }

  -- Tools
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'glepnir/lspsaga.nvim'         -- LSP UIs
  use 'hoob3rt/lualine.nvim'         -- StatusLine
  use 'akinsho/nvim-bufferline.lua'  -- Buffferline
  use 'onsails/lspkind-nvim'         -- VSCode like pictograms
  use 'hrsh7th/cmp-buffer'           -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp'         -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'             -- Completion
  use 'neovim/nvim-lspconfig'        --LSP
  use({
    "L3MON4D3/LuaSnip",
    tag = "v<CurrentMajor>.*",
    run = "make install_jsregexp"
  }) -- Snippets
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use 'jose-elias-alvarez/null-ls.nvim' -- Use neovim as a lenguaje server to inject lSP diagnostic, code actions, and more via lua.
  -- use 'MunifTanjim/prettier.nvim'

  -- Comments
  use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }

  -- Syntax colorizer
  use 'nvim-treesitter/nvim-treesitter'
  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  -- }
  use 'norcalli/nvim-colorizer.lua' --idunno

  -- LSP manager MASON
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'nvim-lua/plenary.nvim'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- Git
  use 'lewis6991/gitsigns.nvim'

  -- Zend Mode
  use 'folke/zen-mode.nvim'
end)
