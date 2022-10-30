return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- LSP autocomplete
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  use 'elixir-editors/vim-elixir'

  use 'nvim-lua/plenary.nvim'

  use('nvim-telescope/telescope.nvim')

  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdateSync'})

  use 'neovim/nvim-lspconfig'

  use 'windwp/nvim-autopairs'

  use 'numToStr/Comment.nvim'

  -- Tpope
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'

  -- Theme
  use({'catppuccin/nvim', as = "catppuccin"})

  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  })
end)
