---@module 'hl'

hl.config({
	plugin = {
		hyprbars = {
			bar_height = 30,
			bar_precedence_over_border = false,
			bar_part_of_window = true,
			bar_buttons_alignment = "left",
			bar_color = "rgb(1a1b26)",
		},
	},
})

hl.plugin.hyprbars.add_button({
	fg_color = "rgb(ff757f)",
	bg_color = "rgb(ff757f)",
	size = 20,
	icon = "󰖭",
	action = 'hyprctl dispatch "hl.dsp.window.close()"',
})

hl.plugin.hyprbars.add_button({
	fg_color = "rgb(c3e88d)",
	bg_color = "rgb(c3e88d)",
	size = 20,
	icon = "",
	action = 'hyprctl dispatch "hl.dsp.window.fullscreen()"',
})
