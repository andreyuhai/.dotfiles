return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
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
      })

      -- main branch does not enable highlight/indent itself
      vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
	  if pcall(vim.treesitter.start, args.buf) then
	    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	  end
	end,
      })
    end
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      enable     = true,
      max_lines  = 5,
      min_window_height = 50,
      trim_scope = 'outer',
      separator = '='

    }
  }
}
