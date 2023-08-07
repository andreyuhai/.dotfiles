local status, builtin = pcall(require, "telescope.builtin")

if not status then
  return
end

vim.keymap.set("n", "<Leader>ff", function ()
  builtin.find_files()
end)

vim.keymap.set("n", "<Leader>fw", function()
  builtin.grep_string { search = vim.fn.expand("<cword>") }
end)

vim.keymap.set("n", "<Leader>fb", function()
  builtin.buffers()
end)

vim.keymap.set("n", "<Leader>fg", function()
  builtin.grep_string({ search = vim.fn.input("Grep For > ") })
end)

vim.keymap.set("n", "<Leader>fl", function()
  require("telescope").extensions.live_grep_args.live_grep_args()
end)
