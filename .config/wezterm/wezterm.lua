local wezterm = require("wezterm")
local config = {}
local no_clown_fiesta, metadata = wezterm.color.load_base16_scheme("/home/vilhelm/dotfiles/.config/wezterm/no-clown-fiesta.yaml")

config.font = wezterm.font {
  family = 'JetBrains Mono',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
}
config.font_size = 20.0
config.color_scheme = "(Gogh)"
--config.color_scheme = "ayu"
--config.color_scheme = "Gruber (base16)"
--config.color_scheme = "Oxocarbon Dark (Gogh)"
config.colors = no_clown_fiesta 
config.enable_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'
config.window_padding = {
  left = 10,
  right = 10,
  top = 0,
  bottom = 0,
}

return config
