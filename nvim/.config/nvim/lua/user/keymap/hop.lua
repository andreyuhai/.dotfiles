local status, hop = pcall(require, "hop")

if not status then
	return
end

vim.keymap.set("n", "<Leader>h", function ()
  hop.hint_words()
end)

vim.keymap.set("n", "<Leader>H", function ()
  hop.hint_words({ multi_windows = true })
end)
