return {
  { "tpope/vim-endwise"  },
  { "tpope/vim-rhubarb"  },
  { "tpope/vim-surround" },

  {
    "tpope/vim-fugitive",
    lazy = false,
    config = function()
      vim.keymap.set("n", "<Leader>gs", vim.cmd.Git)
    end
  }
}
