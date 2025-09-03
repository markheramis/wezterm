# WezTerm Configuration

A modern, feature-rich configuration for the [WezTerm](https://wezfurlong.org/wezterm/) terminal emulator with dynamic theming, auto-maximization, and intelligent hyperlink detection.

## 🚀 Features

### 🎨 **Dynamic Theme Switching**
- Switch between color schemes using environment variables
- Currently supports Nord and One Dark themes
- Easy to extend with additional themes

### 🖥️ **Optimized Display**
- Auto-maximizes window on startup for full-screen experience
- Semi-transparent background (65% opacity) for modern aesthetics
- Minimal window decorations for clean appearance
- Disabled tab bar for single-pane focused workflow

### 🔤 **Typography & Font**
- **JetBrains Mono Bold** font for excellent code readability
- **12.5pt** font size optimized for most displays
- Steady bar cursor (non-blinking) for reduced distraction

### 🔗 **Smart Hyperlink Detection**
- Automatically detects and makes URLs clickable
- Supports URLs in various formats: `(URL)`, `[URL]`, `{URL}`, `<URL>`
- Auto-converts email addresses to `mailto:` links
- Handles standalone URLs intelligently

### ⚙️ **Advanced Features**
- Auto-reload configuration during development
- Skip window close confirmations for faster workflow
- Intelligent font size adjustment algorithm (available but disabled)
- Comprehensive logging for debugging

## 📁 File Structure

```
wezterm/
├── wezterm.lua    # Main entry point with theme selection
├── config.lua     # Core configuration settings
├── events.lua     # Event handlers and utility functions
├── install.sh     # Automated installation script
└── README.md      # This documentation
```

## 🛠️ Installation & Setup

### 1. **Install WezTerm**
```bash
# macOS (Homebrew)
brew install --cask wezterm

# Linux (see official docs for your distribution)
# Windows (see official docs)
```

### 2. **Install Configuration**

#### **Option A: Automated Installation (Recommended)**
```bash
# Clone the repository
git clone https://github.com/markheramis/wezterm ~/wezterm-config
cd ~/wezterm-config

# Run the installation script
chmod +x install.sh
./install.sh
```

The install script will:
- Backup your existing WezTerm configuration (if any) to `~/.config/wezterm.bak`
- Create a symbolic link from the repository to `~/.config/wezterm`
- Allow you to easily update the configuration by pulling changes from the repository

#### **Option B: Manual Installation**
```bash
# Clone this configuration to your WezTerm config directory
# Default locations:
# macOS: ~/.config/wezterm/
# Linux: ~/.config/wezterm/
# Windows: %APPDATA%\wezterm\

git clone https://github.com/markheramis/wezterm ~/.config/wezterm/
# OR copy the files manually to your WezTerm config directory
```

### 3. **Set Theme (Optional)**
```bash
# Add to your shell profile (.bashrc, .zshrc, etc.)
export WEZTERM_THEME=nord     # For Nord theme
# OR
export WEZTERM_THEME=onedark  # For One Dark theme

# Reload your shell or restart terminal
source ~/.zshrc  # or your shell's config file
```

## 🎨 Available Themes

| Theme Name | Environment Value | Description |
|------------|------------------|-------------|
| **Nord** | `nord` | Cool blue/gray palette inspired by arctic colors |
| **One Dark** | `onedark` | Popular dark theme with warm accent colors |

### Adding New Themes

To add a new theme, edit `wezterm.lua`:

```lua
local themes = {
    nord = "Nord (Gogh)",
    onedark = "One Dark (Gogh)",
    -- Add your new theme here
    dracula = "Dracula (Official)",
    monokai = "Monokai Pro",
}
```

Then set the environment variable:
```bash
export WEZTERM_THEME=dracula
```

## ⚡ Key Configuration Highlights

### Window Behavior
- **Auto-maximize**: Window automatically maximizes on startup
- **No close confirmation**: Skip confirmation dialogs for faster workflow
- **Minimal decorations**: Only resize handles visible, no title bar
- **Fixed window size**: Window doesn't resize when font size changes

### Font & Display
- **Font**: JetBrains Mono Bold, 12.5pt
- **Cursor**: Steady vertical bar (non-blinking)
- **Background**: Semi-transparent black (65% opacity)
- **Padding**: Minimal (3px left/right, 0px top/bottom)

### Tab Management
- **Tab bar disabled**: Clean single-pane interface
- **No fancy styling**: Simplified appearance when tabs are enabled

## 🔧 Advanced Features

### Font Size Auto-Adjustment (Disabled by default)

The configuration includes an intelligent font size adjustment algorithm that can eliminate bottom padding when the window is resized. To enable:

1. Uncomment the event handler in `events.lua`:
```lua
wezterm.on("window-resized", function(window, pane)
    readjust_font_size(window, pane)
end)
```

**How it works:**
- Detects window resize events
- Iteratively adjusts font size to minimize padding
- Uses a tolerance-based algorithm (3px tolerance)
- Includes fallback to prevent infinite loops
- Provides debug logging for troubleshooting

### Hyperlink Rules

The configuration includes comprehensive URL detection:

```lua
-- Examples of detected URLs:
(https://example.com)     # URLs in parentheses
[https://example.com]     # URLs in brackets  
{https://example.com}     # URLs in braces
<https://example.com>     # URLs in angle brackets
https://example.com       # Standalone URLs
user@example.com          # Email addresses (converted to mailto:)
```

## 🔄 Updating Configuration

If you used the automated installation (Option A), updating is simple:

```bash
cd ~/wezterm-config
git pull origin main
# Configuration is automatically updated via the symbolic link
```

For manual installations, you'll need to manually copy updated files or re-clone the repository.

## 🐛 Troubleshooting

### Installation Issues
1. **Permission denied**: Ensure you have write permissions to `~/.config/`
2. **Symbolic link exists**: The install script will backup existing configurations automatically
3. **WezTerm not finding config**: Verify the symbolic link was created: `ls -la ~/.config/wezterm`

### Theme Not Applying
1. Verify environment variable is set: `echo $WEZTERM_THEME`
2. Ensure the theme name matches exactly (case-sensitive)
3. Restart WezTerm after setting the environment variable
4. Check that the theme exists in WezTerm's built-in themes

### Font Issues
1. Ensure JetBrains Mono is installed on your system
2. Download from: https://www.jetbrains.com/lp/mono/
3. Restart WezTerm after font installation

### Configuration Not Loading
1. Verify files are in the correct WezTerm config directory
2. Check for Lua syntax errors in the configuration files
3. Enable debug logging in WezTerm for detailed error messages
4. If using symbolic links, ensure the target directory exists and is accessible

## 🤝 Contributing

Feel free to submit issues and enhancement requests! Some ideas for contributions:

- Additional color themes
- New hyperlink detection patterns
- Performance optimizations
- Cross-platform compatibility improvements

## 📄 License

This configuration is provided as-is for educational and personal use. Feel free to modify and distribute according to your needs.

---

**Enjoy your enhanced WezTerm experience!** 🚀
