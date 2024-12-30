local wezterm = require("wezterm")
local config = {}
--local retrobox, metadata = wezterm.color.load_base16_scheme("/home/vilhelm/dotfiles/.config/wezterm/retrobox.yaml")

config.font = wezterm.font("JetBrainsMonoNerdFont")
config.font_size = 22.0
config.color_scheme = "Gruvbox Material (Gogh)"
--config.color_scheme = "ayu"
--config.color_scheme = "Gruber (base16)"
--config.color_scheme = "Oxocarbon Dark (Gogh)"
--config.colors = retrobox
config.enable_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'

return config
