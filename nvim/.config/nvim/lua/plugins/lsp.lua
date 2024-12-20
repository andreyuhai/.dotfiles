return {
  { "neovim/nvim-lspconfig" },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    priority = 60, -- need to set priority otherwise Mason interferes
    config = function()
      local lsp_zero = require("lsp-zero")

      local attach = function(_client, bufnr)
	-- Diagnostics
	vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end)
	vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end)
	vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end)
	vim.keymap.set('n', '<leader>qd', function() vim.diagnostic.setqflist() end)

	-- Definition & declaration shit
	vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end)
	vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end)
	vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end)
	vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end)
	vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end)
	vim.keymap.set('n', 'gs', function() vim.lsp.buf.signature_help() end)

	vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end)
	vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end)
	vim.keymap.set({'n', 'x'}, '<F3>', function() vim.lsp.buf.format({async = true}) end)
	vim.keymap.set('n', '<F4>', function() vim.lsp.buf.code_action() end)
      end

      lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = attach,
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })
    end
  },
}
