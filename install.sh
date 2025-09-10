if [ -d "$HOME/.config/wezterm" ]; then
  mv "$HOME/.config/wezterm" "$HOME/.config/wezterm.bak"
fi

ln -s $(pwd)/config $HOME/.config/wezterm