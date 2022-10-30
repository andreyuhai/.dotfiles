local status, telescope = pcall(require, "telescope.builtin")

if not status then
  return
end

vim.keymap.set("n", "<Leader>ff", function ()
  telescope.find_files()
end)

vim.keymap.set("n", "<Leader>fw", function()
  telescope.grep_string { search = vim.fn.expand("<cword>") }
end)

vim.keymap.set("n", "<Leader>fb", function()
  telescope.buffers()
end)
