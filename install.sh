# Move .config/wezterm to .config/wezterm.bak if it exists
if [ -d "$HOME/.config/wezterm" ]; then
  mv "$HOME/.config/wezterm" "$HOME/.config/wezterm.bak"
fi
# Link wezterm to .config/wezterm
ln -s "$(pwd)/wezterm" "$HOME/.config/wezterm"