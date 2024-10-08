return {

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    name = "catppuccin",
    init = function()
      vim.cmd.colorscheme "catppuccin"
    end,
    opts = {
      transparent_background = true,
      integrations = {
	cmp = true,
	indent_blankline = { enabled = true },
	mason = true,
	telescope = true,
	treesitter = true,
	treesitter_context = true,
	native_lsp = {
	  enabled = true,
	  underlines = {
	    errors = { "undercurl" },
	    hints = { "undercurl" },
	    warnings = { "undercurl" },
	    information = { "undercurl" },
	  },
	},
      }
    },
  },
}
