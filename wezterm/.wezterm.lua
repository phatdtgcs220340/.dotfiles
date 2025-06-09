local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.enable_tab_bar = false
config.default_prog = { "/bin/bash", "-c", "tmux new-session -A -s main && tmux-resurrect restore" }

local function chillColorscheme(_config)
    _config.window_background_image_hsb = {
        hue = 1.0,
        saturation = 0.7,
        brightness = 0.05,
    }
    config.window_background_opacity = 0.91
    -- _config.window_background_image = "/home/pd204/Pictures/wallpapers/makima-eyes.jpg"
    _config.color_scheme = 'Tokyo Night'
end

local function retroColorscheme(_config)
    _config.color_scheme = 'GruvboxDark'
    _config.colors = {
        background = "#262626"
    }
    _config.color_scheme_dirs = { "~/.config/wezterm/colors" }
end

config.font = wezterm.font {
    family = 'JetBrainsMono',
    weight = 'Medium',
    harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' },
}
config.window_decorations = "RESIZE"

chillColorscheme(config)
config.font_size = 17.0

config.default_cwd = wezterm.home_dir
config.keys = {
    -- Horizontal Split
    { key = "h",          mods = "ALT|SHIFT", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
    -- Vertical Split
    { key = "v",          mods = "ALT|SHIFT", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },
    -- Close current pane
    { key = "c",          mods = "ALT|SHIFT", action = wezterm.action.CloseCurrentPane { confirm = true } },
    -- Move to the left pane
    { key = "LeftArrow",  mods = "ALT",       action = wezterm.action.ActivatePaneDirection("Left") },
    -- Move to the right pane
    { key = "RightArrow", mods = "ALT",       action = wezterm.action.ActivatePaneDirection("Right") },
    -- Move to the pane above
    { key = "UpArrow",    mods = "ALT",       action = wezterm.action.ActivatePaneDirection("Up") },
    -- Move to the pane below
    { key = "DownArrow",  mods = "ALT",       action = wezterm.action.ActivatePaneDirection("Down") },
}

config.window_padding = { left = 20, right = 20, top = 20, bottom = 20 }


return config;
