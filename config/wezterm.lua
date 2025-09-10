-- WezTerm Main Configuration Entry Point
-- This is the main file that WezTerm loads. It combines configuration and events,
-- and applies dynamic theming based on environment variables.

local wezterm = require("wezterm")
local config = require("config")    -- Import base configuration settings
require("events")                   -- Load event handlers and utility functions

-- Dynamic Theme Selection System
-- Allows switching color schemes via the WEZTERM_THEME environment variable
-- Usage: export WEZTERM_THEME=nord (or onedark) before starting WezTerm

-- Available theme mappings
local themes = {
	nord = "Nord (Gogh)",           -- Nord color scheme (cool blue/gray palette)
	onedark = "One Dark (Gogh)",    -- One Dark color scheme (popular dark theme)
}

-- Retrieve the current theme from environment variable
-- Uses shell command to get WEZTERM_THEME environment variable value
local success, stdout, stderr = wezterm.run_child_process({ 
	os.getenv("SHELL"),    -- Use the user's default shell
	"-c",                  -- Execute command flag
	"printenv WEZTERM_THEME"  -- Print the environment variable value
})

-- Clean up the theme name by removing all whitespace (including newlines)
local selected_theme = stdout:gsub("%s+", "")

-- Apply the selected theme to the configuration
-- If the theme name exists in our themes table, use it; otherwise, no theme is set
config.color_scheme = themes[selected_theme]

-- Return the final configuration to WezTerm
return config
