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

-- tmux-sessionizer
-- Conflicts with actual CTRL+f, gotta find a new shortcut
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- tmux-vim-picker: Promote popup nvim to a real tmux window
vim.keymap.set("n", "<leader>P", function()
  local cwd = vim.fn.getcwd()
  local file = vim.fn.expand("%:p")
  vim.fn.system({ "tmux-vim-promote", "window", cwd, file })
  vim.defer_fn(function() vim.cmd("qa!") end, 100)
end, { desc = "Promote to tmux window" })

-- tmux-vim-picker: Promote popup nvim to a split pane
vim.keymap.set("n", "<leader>p", function()
  local cwd = vim.fn.getcwd()
  local file = vim.fn.expand("%:p")
  vim.fn.system({ "tmux-vim-promote", "split", cwd, file })
  vim.defer_fn(function() vim.cmd("qa!") end, 100)
end, { desc = "Promote to tmux split" })

-- Copy-path in visual mode
vim.keymap.set('x', '<C-p>', function()
  local path = vim.fn.expand('%:p')
  local start_line = vim.fn.getpos('v')[2]
  local end_line = vim.fn.getpos('.')[2]

  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  vim.fn.setreg('+', path .. ':' .. start_line .. '-' .. end_line)
end)

-- Preview current markdown file rendered with glow in a floating window
vim.keymap.set("n", "<leader>md", function()
  local file = vim.api.nvim_buf_get_name(0)
  if file == "" then return end

  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = "minimal",
    border = "rounded",
  })

  vim.fn.termopen("glow -p " .. vim.fn.shellescape(file))
  vim.cmd("startinsert")

  -- Close the float with q or Esc
  vim.keymap.set("t", "q", function()
    vim.api.nvim_win_close(win, true)
  end, { buffer = buf })
  vim.keymap.set("t", "<Esc>", function()
    vim.api.nvim_win_close(win, true)
  end, { buffer = buf })
end, { desc = "Preview markdown with glow" })

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
