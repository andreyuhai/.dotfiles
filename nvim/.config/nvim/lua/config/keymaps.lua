-- Keep the line centered on search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Quicklist navigation
vim.keymap.set("n", "<C-j>", ":cn<esc>zz")
vim.keymap.set("n", "<C-k>", ":cp<esc>zz")

-- Edit vim config
vim.keymap.set("n", "<Leader>ev", ":e $MYVIMRC<cr>", { silent = true })
vim.keymap.set("n", "<Leader>sv", ":source $MYVIMRC<cr>", { silent = true })

-- LSP
vim.keymap.set("n", "<Leader>=", ":lua vim.lsp.buf.format()<cr>", { silent = true })

-- Netrw
vim.keymap.set("n", "<Leader>pv", vim.cmd.Ex)

-- Elixir IO.inspect
vim.api.nvim_create_autocmd("FileType", {
  pattern = "elixir",
  callback = function()
    local function insert_IO_inspect(direction)
      local word = vim.fn.expand("<cword>")
      local inspect_string = string.format(
	'IO.inspect(%s, label: "\\n[L:#{__ENV__.line}] - #{__MODULE__}.#{elem(__ENV__.function, 0)}/#{elem(__ENV__.function, 1)} - %s:\\n", limit: :infinity, charlists: :as_lists, pretty: true)',
	word,
	word
      )

      local current_line = vim.fn.line(".")
      local insert_line = direction == "below" and current_line or current_line - 1
      vim.api.nvim_buf_set_lines(0, insert_line, insert_line, false, {inspect_string})
      vim.api.nvim_win_set_cursor(0, {insert_line + 1, 0}) -- move to inserted line
      vim.cmd("normal! ==") -- auto-indent current line
    end

    -- Insert IO.inspect for the <cword> on the line below
    vim.keymap.set("n", "<leader>i", function()
      insert_IO_inspect("below")
    end, { buffer = true, desc = "Insert IO.inspect for word under cursor on the line below" })

    -- Insert IO.inspect for the <cword> on the line above
    vim.keymap.set("n", "<leader>I", function()
      insert_IO_inspect("above")
    end, { buffer = true, desc = "Insert IO.inspect for word under cursor on the line above" })
  end,
})
