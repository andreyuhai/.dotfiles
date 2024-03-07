local status, treesitter_context = pcall(require, "treesitter-context")

if not status then
	return
end

treesitter_context.setup {
  enable = true,
  max_lines = 5, -- maximum number of context lines, 0 means no limit.
  trim_scope = 'outer'
}
