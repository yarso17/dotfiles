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
  use "olimorris/onedarkpro.nvim"

  -- Another themes
  -- use 'navarasu/onedark.nvim'
  -- use {
  --   'svrana/neosolarized.nvim',
  --   requires = { 'tjdevries/colorbuddy.nvim' }
  -- }

  -- Tools
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'glepnir/lspsaga.nvim'         -- LSP UIs
  use({
    "L3MON4D3/LuaSnip",
    tag = "v<CurrentMajor>.*",
    run = "make install_jsregexp"
  })
  use 'hoob3rt/lualine.nvim'            -- StatusLine
  use 'akinsho/nvim-bufferline.lua'     -- Buffferline
  use 'onsails/lspkind-nvim'            -- VSCode like pictograms
  use 'hrsh7th/cmp-buffer'              -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp'            -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'                -- Completion
  use 'neovim/nvim-lspconfig'           --LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use neovim as a lenguaje server to inject lSP diagnostic, code actions, and more via lua.

  -- Comments
  use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }

  -- Syntax colorizer
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
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
end)
