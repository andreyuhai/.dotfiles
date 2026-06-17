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
      -- transparent_background alone no longer makes floating windows
      -- transparent in catppuccin; floats need their own opt-in. Without
      -- this, Telescope (TelescopeNormal -> NormalFloat) gets the opaque
      -- mantle background.
      float = {
        transparent = true,
      },
      auto_integrations = true,
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
      },
    },
  },
}
