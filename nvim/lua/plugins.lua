local status, packer = pcall(require, 'packer')
if (not status) then
  print('Packer is not installed')
  return
end

vim.cmd [[packadd packer.nvim]]
packer.startup(function(use)
  -- use 'neovim/nvim-lsp'
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'          -- Common utilities
  use 'craftzdog/solarized-osaka.nvim' -- Theme 1
  use 'olimorris/onedarkpro.nvim'      -- Theme 2
  use 'hoob3rt/lualine.nvim'           -- Statusline
  use 'onsails/lspkind-nvim'           -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer'             -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp'           -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'               -- Completion
  use 'neovim/nvim-lspconfig'          -- LSP
  use 'nvimdev/lspsaga.nvim'           -- LSP UIs
  use 'L3MON4D3/LuaSnip'
  use 'nvimtools/none-ls.nvim'         -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use "nvimtools/none-ls-extras.nvim"
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'windwp/nvim-autopairs'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'akinsho/nvim-bufferline.lua'
  use 'norcalli/nvim-colorizer.lua'
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'github/copilot.vim'
  use 'akinsho/flutter-tools.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'HiPhish/nvim-ts-rainbow2'
end)