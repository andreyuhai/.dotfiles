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
	["lua_ls"] = function ()
	  local lspconfig = require("lspconfig")

	  lspconfig.lua_ls.setup {
	    settings = {
	      Lua = {
		diagnostics = {
		  -- To avoid undefined global `vim` warnings
		  globals = { "vim" }
		}
	      }
	    }
	  }
	end,
      }
    }
  }
}
