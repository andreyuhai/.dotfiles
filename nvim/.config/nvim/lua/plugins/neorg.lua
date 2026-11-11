return {
  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    -- load the parser rocks first, so neorg finds them on package.cpath
    dependencies = { "nvim-neorg/tree-sitter-norg", "nvim-neorg/tree-sitter-norg-meta" },
    config = true,
  }
}
