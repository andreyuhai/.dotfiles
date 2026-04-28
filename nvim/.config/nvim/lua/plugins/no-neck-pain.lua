return {
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    opts = {
      -- Width of the centered buffer
      width = 160,
      -- Minimum width of the left and right side buffers, on smaller screens/widths they'll close
      minSideBufferWidth = 50,
      autocmds = {
	enableOnVimEnter = true
      }
    }
  }
}
