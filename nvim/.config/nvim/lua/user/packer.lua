local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- LSP autocomplete
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use 'elixir-editors/vim-elixir'

  use 'nvim-lua/plenary.nvim'

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdateSync'}
  use 'nvim-treesitter/nvim-treesitter-context'

  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  }

  use 'neovim/nvim-lspconfig'

  use 'windwp/nvim-autopairs'

  use 'numToStr/Comment.nvim'

  -- Tpope
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'

  -- Theme
  use {'catppuccin/nvim', as = "catppuccin"}

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use 'github/copilot.vim'

  use 'phaazon/hop.nvim'

  use 'lukas-reineke/indent-blankline.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
