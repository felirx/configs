---@module 'hl'

-- desktop

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "altgr-intl",
		kb_model = "",
		kb_options = "caps:escape",
		kb_rules = "",
		accel_profile = "flat",
		numlock_by_default = true,
		follow_mouse = 1,
		sensitivity = 0,
		-- -1.0 - 1.0, 0 means no modification.
		touchpad = {
			natural_scroll = false,
			disable_while_typing = true,
			clickfinger_behavior = true,
			tap_to_click = false,
		},
	},
})

hl.env("XCURSOR_THEME", "Breeze_Dark_Fuchsia")
hl.env("XCURSOR_SIZE", 64)
hl.env("HYPRCURSOR_THEME", "Breeze_Dark_Fuchsia")
hl.env("HYPRCURSOR_SIZE", 64)
