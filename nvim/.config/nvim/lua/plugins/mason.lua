return {
  {
    "williamboman/mason.nvim",
    config = true
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
	"dockerls",
	"html",
	"lua_ls",
	"ruby_lsp",
	"rust_analyzer",
	"sqls",
	"tailwindcss",
	"terraformls",
	"tsserver",
	"yamlls",
      },
      handlers = {
	function(server_name)
	  require("lspconfig")[server_name].setup({})
	end,
      }
    }
  }
}
