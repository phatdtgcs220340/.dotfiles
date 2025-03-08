local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.enable_tab_bar = false

config.color_scheme = 'Tokyo Night'
config.font = wezterm.font('JetBrains Mono')
config.window_decorations = "RESIZE"

config.window_padding = {
    left = 10,
    right = 0,
    top = 10,
    bottom = 0,
}

config.window_background_image_hsb = {
	hue = 1.0,
	saturation = 0.7,
	brightness = 0.02,
}
config.font_size = 14.0
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })

config.set_environment_variables = {
	term = "xterm-256color"
}

config.window_background_opacity = 0.98
config.window_background_image = "/home/pd204/Pictures/wallpapers/wallpaper-4.png"

config.default_cwd = wezterm.home_dir
config.keys = {
 -- Horizontal Split 
    {key="h", mods="ALT|SHIFT", action=wezterm.action.SplitHorizontal{domain="CurrentPaneDomain"}},
 -- Vertical Split
    {key="v", mods="ALT|SHIFT", action=wezterm.action.SplitVertical{domain="CurrentPaneDomain"}},
 -- Close current pane
    {key = "c", mods = "ALT|SHIFT", action = wezterm.action.CloseCurrentPane{confirm = true}},

 -- Move to the left pane
    {key = "LeftArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left")},
 -- Move to the right pane
    {key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right")},
 -- Move to the pane above
    {key = "UpArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up")},
 -- Move to the pane below
    {key = "DownArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down")},
}

config.initial_cols = 315
config.initial_rows = 75
config.window_padding = { left = 10, right = 10, top = 10, bottom = 10 }


return config;
