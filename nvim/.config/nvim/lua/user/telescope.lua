local status, telescope = pcall(require, "telescope")

if not status then
	return
end

telescope.setup {
  defaults = {
    -- layout_strategy = 'bottom_pane',
    -- layout_config = { width = 0.4 },
  }
}
