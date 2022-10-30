-- Keep the line centered on search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Quicklist navigation
vim.keymap.set("n", "<C-j>", ":cn<esc>zz")
vim.keymap.set("n", "<C-k>", ":cp<esc>zz")

-- Easy debug line for Elixir
vim.keymap.set("n", ",p", "orequire IEx; IEx.pry()<ESC>")
vim.keymap.set("n", ",P", "Orequire IEx; IEx.pry()<ESC>")

-- Open up a terminal in split
vim.keymap.set("n", "<Leader>t", ":split <bar> resize 15 <bar> terminal<cr>")
