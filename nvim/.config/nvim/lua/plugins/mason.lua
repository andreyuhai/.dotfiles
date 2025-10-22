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
	"ts_ls",
	"yamlls",
	"expert"
      },

      handlers = {
	function(server_name)
	  require("lspconfig")[server_name].setup({})
	end,
	["lua_ls"] = function ()
	  local lspconfig = require("lspconfig")

	  lspconfig.lua_ls.setup {
	    settings = {
	      Lua = {
		diagnostics = {
		  -- To avoid undefined global `vim` warnings
		  globals = { "vim" }
		},

		-- This currently doesn't work for some reason.
		format = {
		  defaultConfig = {
		    indent_size = "2",
		    indent_style = "space",
		    quote_style = "single"
		  }
		}
	      }
	    }
	  }
	end,
      }
    }
  }
}
