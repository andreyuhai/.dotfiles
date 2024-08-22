vim.opt.nu             = true
vim.opt.relativenumber = true

vim.opt.ignorecase     = true
vim.opt.smartcase      = true

vim.opt.encoding       = 'UTF-8'

vim.opt.splitbelow     = true
vim.opt.splitright     = true

vim.opt.shiftwidth     = 2
vim.opt.scrolloff      = 8

vim.opt.guicursor      = ""
vim.opt.hidden         = true
vim.opt.hlsearch       = false
vim.opt.signcolumn     = "yes"

vim.opt.swapfile       = false
vim.opt.backup         = false
vim.opt.undodir        = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile       = true

vim.opt.completeopt    = {"menu", "menuone", "noselect"}
