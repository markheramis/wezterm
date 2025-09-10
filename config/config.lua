-- WezTerm configuration module
-- This file contains the main configuration settings for the WezTerm terminal emulator
local wezterm = require("wezterm")
local config = {}

-- Use the config builder if available (recommended for newer WezTerm versions)
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config = {
	-- Cursor Configuration
	-- Set cursor to a steady vertical bar instead of blinking block
	default_cursor_style = "SteadyBar",
	
	-- Auto-reload Configuration
	-- Automatically reload config when config files change (useful during development)
	automatically_reload_config = true,
	
	-- Window Behavior
	-- Skip confirmation dialog when closing windows (faster workflow)
	window_close_confirmation = "NeverPrompt",
	-- Prevent window resizing when font size changes (maintains consistent window size)
	adjust_window_size_when_changing_font_size = false,
	-- Show only resize handles, hide title bar and other decorations for cleaner look
	window_decorations = "RESIZE",
	
	-- Update Settings
	-- Disable automatic update checks (manual updates preferred)
	check_for_updates = false,
	
	-- Tab Bar Configuration
	-- Disable fancy tab bar styling for simpler appearance
	use_fancy_tab_bar = false,
	-- Keep tab bar at top (false = top, true = bottom)
	tab_bar_at_bottom = false,
	-- Completely disable tab bar for single-pane usage
	enable_tab_bar = false,
	
	-- Font Configuration
	-- Set font size to 10pt for good readability
	font_size = 10,
	-- Use JetBrains Mono with bold weight for better code visibility
	font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
	
	-- Window Padding
	-- Add minimal padding around terminal content
	window_padding = {
		left = 3,    -- 3px left padding
		right = 3,   -- 3px right padding
		top = 0,     -- No top padding
		bottom = 0,  -- No bottom padding
	},
	
	-- Background Configuration
	-- Set semi-transparent black background for modern appearance
	background = {
		{
			source = {
				Color = "#000000",  -- Pure black background
			},
			width = "100%",   -- Cover full width
			height = "100%",  -- Cover full height
			opacity = 0.65,   -- 65% opacity for transparency effect
		},
	},
	-- Hyperlink Detection Rules
	-- Enhanced URL detection and clickability (inspired by: https://akos.ma/blog/adopting-wezterm/)
	-- These rules make URLs clickable in the terminal output
	hyperlink_rules = {
		-- Match URLs wrapped in parentheses: (https://example.com)
		{
			regex = "\\((\\w+://\\S+)\\)",
			format = "$1",        -- Extract URL without parentheses
			highlight = 1,        -- Highlight the captured group
		},
		-- Match URLs wrapped in square brackets: [https://example.com]
		{
			regex = "\\[(\\w+://\\S+)\\]",
			format = "$1",        -- Extract URL without brackets
			highlight = 1,        -- Highlight the captured group
		},
		-- Match URLs wrapped in curly braces: {https://example.com}
		{
			regex = "\\{(\\w+://\\S+)\\}",
			format = "$1",        -- Extract URL without braces
			highlight = 1,        -- Highlight the captured group
		},
		-- Match URLs wrapped in angle brackets: <https://example.com>
		{
			regex = "<(\\w+://\\S+)>",
			format = "$1",        -- Extract URL without angle brackets
			highlight = 1,        -- Highlight the captured group
		},
		-- Match standalone URLs (not wrapped in brackets)
		-- Improved regex to avoid matching URLs that are already in parentheses
		{
			regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
			format = "$1",        -- Extract the URL
			highlight = 1,        -- Highlight the captured group
		},
		-- Auto-detect email addresses and make them clickable mailto links
		{
			regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
			format = "mailto:$0", -- Convert to mailto: link
		},
	},
}
return config
