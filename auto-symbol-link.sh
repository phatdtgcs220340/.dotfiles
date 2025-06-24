#!/bin/bash

# Remove and link Neovim config
rm -rf "$HOME/.config/nvim"
ln -s "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"

# Remove and link Fish shell config
rm -rf "$HOME/.config/fish"
ln -s "$HOME/.dotfiles/fish" "$HOME/.config/fish"

# Remove and link starship config
rm -rf "$HOME/.config/starship.toml"
ln -s "$HOME/.dotfiles/fish/starship.toml" "$HOME/.config/starship.toml"

# Remove and link Ghostty terminal config
rm -rf "$HOME/.config/ghostty"
ln -s "$HOME/.dotfiles/ghostty" "$HOME/.config/ghostty"

# Remove and link Neofetch config
rm -rf "$HOME/.config/neofetch"
ln -s "$HOME/.dotfiles/neofetch" "$HOME/.config/neofetch"

# Remove and link Swappy config
rm -rf "$HOME/.config/swappy"
ln -s "$HOME/.dotfiles/swappy" "$HOME/.config/swappy"

# Remove and link Sway config
rm -rf "$HOME/.config/sway"
ln -s "$HOME/.dotfiles/sway" "$HOME/.config/sway"

# Remove and link WezTerm config
rm -rf "$HOME/.config/wezterm"
ln -s "$HOME/.dotfiles/wezterm" "$HOME/.config/wezterm"

# Remove and link .tmux.conf config
rm -rf "$HOME/.tmux.conf"
ln -s "$HOME/.dotfiles/.tmux.conf" "$HOME/.tmux.conf"

# Remove and link Waybar config
rm -rf "$HOME/.config/waybar"
ln -s "$HOME/.dotfiles/waybar" "$HOME/.config/waybar"

# Remove and link wofi config
rm -rf "$HOME/.config/wofi"
ln -s "$HOME/.dotfiles/wofi" "$HOME/.config/wofi"




