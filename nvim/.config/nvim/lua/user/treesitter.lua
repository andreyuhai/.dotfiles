local status, treesitter = pcall(require, "nvim-treesitter.configs")

if not status then
	return
end


treesitter.setup {
  ensure_installed = {
    "c",
    "css",
    "dockerfile",
    "eex",
    "elixir",
    "erlang",
    "gitignore",
    "heex",
    "html",
    "javascript",
    "json",
    "lua",
    "proto",
    "python",
    "regex",
    "ruby",
    "rust",
    "scss",
    "sql",
    "tsx",
    "vim",
    "yaml"
  },
  highlight = { enable = true }
}
