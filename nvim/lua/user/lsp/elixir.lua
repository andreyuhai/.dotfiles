local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").elixirls.setup {
  cmd = { "/Users/burakaymakci/git/elixir-ls/release/language_server.sh" };
  capabilities = capabilities;

  on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})

    vim.keymap.set("n", "<Leader>db", vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set("n", "<Leader>df", vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set("n", "<Leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
  end
}
