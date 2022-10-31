local status, luasnip = pcall(require, "luasnip")

if not status then
  return
end

vim.keymap.set({ "i", "s"}, "<c-k>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true})

vim.keymap.set({ "i", "s"}, "<c-j>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true})
