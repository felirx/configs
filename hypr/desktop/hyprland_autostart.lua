---@module 'hl'

-- desktop

-- Autostart
hl.on("hyprland.start", function()
	hl.exec_cmd("[workspace 3 silent] local_var_terminal")
	hl.exec_cmd("[workspace 5 silent] discord")
	hl.exec_cmd("[workspace 6 silent] steam")
	hl.exec_cmd("[workspace 9 silent] virt-manager")
	hl.exec_cmd("openrgb --startminimized --profile kek")
	hl.exec_cmd("hyprpm reload -n")
	hl.exec_cmd("hyprctl dispatch workspace 3")
end)
