local status, catppuccin = pcall(require, "catppuccin")

if not status then
	return
end

catppuccin.setup {
  flavour = "macchiato"
}

vim.api.nvim_command "colorscheme catppuccin"

vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = true, sp = "#858ba8", italic = true, bg = "#1e1e1e" })
