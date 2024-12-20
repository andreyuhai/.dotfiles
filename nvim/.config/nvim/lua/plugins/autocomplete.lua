return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-cmdline" ,
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path" ,
      "rafamadriz/friendly-snippets",
      -- required for LuaSnip to work with nvim-cmp
      "saadparwaiz1/cmp_luasnip"
    },
    config = function()
      local cmp = require("cmp")

      local luasnip = require("luasnip")

      cmp.setup({
	snippet = {
	  expand = function(args)
	    luasnip.lsp_expand(args.body)
	  end,
	},

	window = {
	  completion = cmp.config.window.bordered(),
	  documentation = cmp.config.window.bordered(),
	},

	mapping = cmp.mapping.preset.insert({
	  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ['<C-e>'] = cmp.mapping.abort(),
	  -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	  ['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),

	formatting = {
	  -- Show the source of the completion on pop-up
	  format = function (entry, vim_item)
	    vim_item.menu = ({
	      buffer = "[Buffer]",
	      calc = "[Calc]",
	      luasnip = "[LuaSnip]",
	      nvim_lsp = "[LSP]",
	      nvim_lua = "[Lua]",
	      path = "[Path]",
	    })[entry.source.name]

	    return vim_item
	  end
	},

	sources = cmp.config.sources({
	  { name = 'nvim_lsp', priority = 1000 },
	  { name = 'luasnip',  priority = 500  },
	  { name = 'nvim_lua', priority = 250 },
	  { name = 'buffer',   priority = 250 },
	  { name = 'path',     priority = 250 },
	  { name = 'calc',     priority = 250 },
	})
      })

      -- Use buffer source for search commands `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
	  { name = 'buffer' }
	}
      })

      -- Use cmdline & path source for command line mode (`:`) (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
	  { name = 'path' }
	}, {
	    { name = 'cmdline' }
	  })
      })

      -- Set up lspconfig.
      require('cmp_nvim_lsp').default_capabilities()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  }
}
