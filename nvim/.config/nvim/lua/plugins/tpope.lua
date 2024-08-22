return {
  { "tpope/vim-endwise"  },
  { "tpope/vim-rhubarb"  },
  { "tpope/vim-surround" },
  {
    "tpope/vim-fugitive",
    lazy = false,
    init = function()
      vim.keymap.set("n", "<Leader>gs", vim.cmd.Git)
    end
  }
}
