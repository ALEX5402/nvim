local status_ok, cyberdream = pcall(require, "cyberdream")
if not status_ok then
	return
end

cyberdream.setup({
	transparent = false,
	italic_comments = true,
	hide_fillchars = true,
	borderless_telescope = true,
	terminal_colors = true,
})
