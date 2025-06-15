local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.enable_tab_bar = false
config.default_prog = { "/bin/bash", "-c", "tmux new-session -A -s main && tmux-resurrect restore" }

local function chillColorscheme(_config)
    -- _config.window_background_image_hsb = {
    --     hue = 0.583,
    --     saturation = 0.48,
    --     brightness = 0.05,
    -- }
    config.window_background_opacity = 0.91
    -- _config.window_background_image = "/home/pd204/Pictures/wallpapers/janedoe-landscape-1.jpg"
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

config.window_padding = { left = 20, right = 20, top = 20 }

config.initial_cols = 315
config.initial_rows = 75

return config;
