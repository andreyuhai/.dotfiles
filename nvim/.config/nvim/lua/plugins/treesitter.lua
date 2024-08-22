return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
	highlight = { enable = true },
	indent = { enable = true },
	sync_install = false,
	ensure_installed = {
	  "bash",
	  "c",
	  "css",
	  "diff",
	  "dockerfile",
	  "eex",
	  "elixir",
	  "erlang",
	  "gitignore",
	  "graphql",
	  "hcl",
	  "heex",
	  "helm",
	  "html",
	  "http",
	  "javascript",
	  "jq",
	  "jsdoc",
	  "json",
	  "jsonc",
	  "lua",
	  "luadoc",
	  "luap",
	  "markdown",
	  "markdown_inline",
	  "mermaid",
	  "printf",
	  "proto",
	  "python",
	  "query",
	  "regex",
	  "ruby",
	  "rust",
	  "scss",
	  "sql",
	  "terraform",
	  "toml",
	  "tsx",
	  "typescript",
	  "vim",
	  "vimdoc",
	  "xml",
	  "yaml",
	},
      })
    end
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      local context = require("treesitter-context")

      context.setup {
	enable     = true,
	max_lines  = 5,
	trim_scope = 'outer'
      }
    end
  }
}
