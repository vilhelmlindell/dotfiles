local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("IosevkaTermNerdFontMono")
config.font_size = 18.0
--config.color_scheme = 'GruvboxDarkHard'
--config.color_scheme = "ayu"
--config.color_scheme = "Gruber (base16)"
--config.color_scheme = "Oxocarbon Dark (Gogh)"
config.color_scheme = 'Catppuccin Mocha'
config.enable_tab_bar = false

--config.colors = {
--  -- The default text color
--  foreground = '#ebdbb2',   -- Corresponds to '#ebdbb2'
--  -- The default background color
--  background = '#1c1c1c',   -- Corresponds to '#1c1c1c'
--
--  -- Overrides the cell background color when the current cell is occupied by the
--  -- cursor and the cursor style is set to Block
--  cursor_bg = '#83a598',    -- Corresponds to '#83a598'
--  -- Overrides the text color when the current cell is occupied by the cursor
--  cursor_fg = '#1c1c1c',    -- Corresponds to '#1c1c1c'
--  -- Specifies the border color of the cursor when the cursor style is set to Block,
--  -- or the color of the vertical or horizontal bar when the cursor style is set to
--  -- Bar or Underline.
--  cursor_border = '#83a598', -- Corresponds to '#83a598'
--
--  -- the foreground color of selected text
--  selection_fg = '#1c1c1c', -- Corresponds to '#1c1c1c'
--  -- the background color of selected text
--  selection_bg = '#fbf1c7', -- Corresponds to '#fffacd'
--
--  -- The color of the scrollbar "thumb"; the portion that represents the current viewport
--  scrollbar_thumb = '#222222',
--
--  -- The color of the split lines between panes
--  split = '#444444',
--
--  ansi = {
--    '#1c1c1c',  -- black
--    '#cc241d',  -- red
--    '#98971a',  -- green
--    '#d79921',  -- yellow
--    '#458588',  -- blue
--    '#b16286',  -- magenta
--    '#689d6a',  -- cyan
--    '#a89984',  -- white (or light grey)
--  },
--  brights = {
--    '#928374',  -- bright black (grey)
--    '#fb4934',  -- bright red
--    '#b8bb26',  -- bright green
--    '#fabd2f',  -- bright yellow
--    '#83a598',  -- bright blue
--    '#d3869b',  -- bright magenta
--    '#8ec07c',  -- bright cyan
--    '#ebdbb2',  -- bright white
--  },
--
--  -- Arbitrary colors of the palette in the range from 16 to 255
--  indexed = { [136] = '#d79921' },
--
--  -- Compose state cursor color
--  compose_cursor = '#fe8019',  -- Corresponds to orange '#fe8019'
--
--  -- Colors for copy_mode and quick_select
--  copy_mode_active_highlight_bg = { Color = '#1c1c1c' },
--  copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
--  copy_mode_inactive_highlight_bg = { Color = '#83a598' },
--  copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },
--
--  quick_select_label_bg = { Color = 'peru' },
--  quick_select_label_fg = { Color = '#ffffff' },
--  quick_select_match_bg = { AnsiColor = 'Navy' },
--  quick_select_match_fg = { Color = '#ffffff' },
--}

return config
