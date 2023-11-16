local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not status then
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

require("lspconfig").elixirls.setup {
  -- Don't forget to put the language server
  -- under bin as elixir_language_server.sh
  cmd = { "elixir_language_server.sh" };
  capabilities = capabilities;

  on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})

    vim.keymap.set("n", "<Leader>db", vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set("n", "<Leader>df", vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set("n", "<Leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
  end;

  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = false
    }
  }
}
