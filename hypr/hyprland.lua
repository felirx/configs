---@module 'hl'
local hyprland_gpus = require("sources/hyprland_gpus")
local hyprland_monitors = require("sources/hyprland_monitors")
local hyprland_experimental = require("sources/hyprland_experimental")
local hyprland_hyprbars = require("hyprland_hyprbars")
local hyprland_autostart = require("sources/hyprland_autostart")
local terminal = "kitty"
local fileManager = "dolphin"

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 20,
		border_size = 2,
		-- https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
		--    col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
		-- Set to true enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,
		-- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
		allow_tearing = false,
		layout = "master",
		col = {
			active_border = "rgba(c099ffaa)",
			inactive_border = "rgba(111118aa)",
		},
	},
})

hl.config({
	decoration = {
		rounding = 10,
		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		-- https://wiki.hyprland.org/Configuring/Variables/#blur
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},
})

hl.config({
	animations = {
		enabled = true,
	},
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })
hl.config({
	dwindle = {
		preserve_split = true,
		-- You probably want this
	},
})

hl.config({
	master = {
		new_status = "master",
	},
})

hl.config({
	misc = {
		force_default_wallpaper = -1,
		-- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false,
		-- If true disables the random hyprland logo / anime girl background. :(
		focus_on_activate = true,
		render_unfocused_fps = 60,
	},
})

local hyprland_keyboard = require("sources/hyprland_keyboard")

hl.config({
	gestures = {},
})

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
})

hl.env("GDK_SCALE", 1)

local mainMod = "SUPER"

-- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more

hl.bind(mainMod .. " + " .. "Q", hl.dsp.exec_cmd("kitty"))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "C", hl.dsp.window.close())

hl.bind(mainMod .. " + " .. "CTRL + SHIFT" .. " + " .. "M", hl.dsp.exit())

hl.bind(mainMod .. " + " .. "CTRL + SHIFT" .. " + " .. "L", hl.dsp.exec_cmd("noctalia msg panel-toggle session"))

hl.bind(mainMod .. " + " .. "F", hl.dsp.window.float())
hl.bind(mainMod .. " + " .. "Space", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "S", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("SHIFT" .. " + " .. "Print", hl.dsp.exec_cmd("grim"))
hl.bind(mainMod .. " + " .. "CTRL + SHIFT" .. " + " .. "S", hl.dsp.exec_cmd("grim"))

hl.bind(mainMod .. " + " .. "R", hl.dsp.layout("orientationnext"))

hl.bind(mainMod .. " + " .. "H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + " .. "L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + " .. "K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + " .. "J", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + " .. 1, hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + " .. 2, hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + " .. 3, hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + " .. 4, hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + " .. 5, hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + " .. 6, hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + " .. 7, hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + " .. 8, hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + " .. 9, hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + " .. 0, hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + " .. "apostrophe", hl.dsp.focus({ workspace = 11 }))

hl.bind(mainMod .. " + " .. "comma", hl.dsp.focus({ workspace = 12 }))

hl.bind(mainMod .. " + " .. "period", hl.dsp.focus({ workspace = 13 }))

hl.bind(mainMod .. " + " .. "p", hl.dsp.focus({ workspace = 14 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 1, hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 2, hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 3, hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 4, hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 5, hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 6, hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 7, hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 8, hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 9, hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. 0, hl.dsp.window.move({ workspace = 10 }))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "apostrophe", hl.dsp.window.move({ workspace = 11 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "comma", hl.dsp.window.move({ workspace = 12 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "period", hl.dsp.window.move({ workspace = 13 }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "p", hl.dsp.window.move({ workspace = 14 }))

-- hl.bind(mainMod .. " + " .. "S", hl.dsp.workspace.toggle_special("magic"))

hl.bind(mainMod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+ -d amdgpu_bl0"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%- -d amdgpu_bl0"), { locked = true })
hl.bind("XF86KbdBrightnessDown", hl.dsp.exec_cmd("asusctl -p"), { locked = true })
hl.bind("XF86KbdBrightnessUp", hl.dsp.exec_cmd("asusctl -n"), { locked = true })

-- Requires playerctl

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "M", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + " .. "M", hl.dsp.window.fullscreen({ mode = "maximized" }))

--bind = CTRL, 0, pass, class:^(discord)$

--#############################

--## WINDOWS AND WORKSPACES ###

--#############################

local hyprland_workspaces = require("sources/hyprland_workspaces")
-- Fix some dragging issues with XWayland

hl.window_rule({
	name = "match_class___",
	match = {
		class = "^$",
		title = "^$",
		xwayland = 1,
		float = 1,
		fullscreen = 0,
		pin = 0,
	},
	no_focus = 1,
})

--debug:disable_logs = false

-- Autostart
hl.on("hyprland.start", function()
	hl.exec_cmd("uwsm app -- /usr/libexec/pam_kwallet_init")
	hl.exec_cmd("noctalia")
	hl.exec_cmd("sleep2; systemctl --user start hyprpolkitagent")
	hl.exec_cmd("xhost +SI:localuser:$(id -un) &")
	hl.exec_cmd("xhost +SI:localuser:root &")
end)

-- For Noctalia Color templates
require("noctalia")
