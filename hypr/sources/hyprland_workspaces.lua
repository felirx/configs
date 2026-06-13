---@module 'hl'

-- desktop`

hl.workspace_rule({
	workspace = 1,
	monitor = "HDMI-A-1",
})

hl.workspace_rule({
	workspace = 2,
	monitor = "HDMI-A-1",
})

hl.workspace_rule({
	workspace = 3,
	monitor = "HDMI-A-1",
	default = true,
})

hl.workspace_rule({
	workspace = 4,
	monitor = "HDMI-A-1",
})

hl.workspace_rule({
	workspace = 5,
	monitor = "HDMI-A-1",
})

hl.workspace_rule({
	workspace = 6,
	monitor = "HDMI-A-1",
})

hl.workspace_rule({
	workspace = 7,
	monitor = "HDMI-A-1",
})

hl.workspace_rule({
	workspace = 8,
	monitor = "HDMI-A-1",
})

hl.workspace_rule({
	workspace = 9,
	monitor = "HDMI-A-1",
})

hl.workspace_rule({
	workspace = 10,
	monitor = "HDMI-A-1",
})

hl.workspace_rule({
	workspace = 11,
	monitor = "DP-2",
	default = true,
})

hl.workspace_rule({
	workspace = 12,
	monitor = "DP-2",
})

hl.workspace_rule({
	workspace = 13,
	monitor = "DP-2",
})

hl.workspace_rule({
	workspace = 14,
	monitor = "DP-2",
})

hl.window_rule({
	name = "steam_app_",
	match = {
		class = "^(steam_app_.*)$",
	},
	workspace = 1,
	fullscreen = 1,
})

hl.window_rule({
	name = "gamescope",
	match = {
		class = "^(gamescope)$",
	},
	workspace = 1,
	fullscreen = 1,
})

hl.window_rule({
	name = "exe, not act",
	match = {
		class = "^/(?!advanced)(.*.exe)$",
	},
	workspace = 1,
	fullscreen = 1,
})

hl.window_rule({
	name = "exe, act",
	match = {
		class = "^(.*advanced.*.exe)$",
	},
	workspace = 2,
})

hl.window_rule({
	name = "act, float",
	match = {
		class = "^(.*advanced.*.exe)$",
	},
	float = 1,
})

hl.window_rule({
	name = "some souls maddness",
	match = {
		class = "^(steam_app_374320)$",
	},
	render_unfocused = 1,
})

hl.window_rule({
	name = "some souls maddness 2",
	match = {
		class = "^(steam_app_1364780)$",
	},
	render_unfocused = 1,
})

hl.window_rule({
	name = "som exe maddness",
	match = {
		class = "^/(?!advanced)(.*.exe)$",
	},
	render_unfocused = 1,
})
