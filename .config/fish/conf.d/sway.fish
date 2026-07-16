# If running from tty1 start sway

set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

set -gx GTK_THEME Adwaita:dark
set -gx GTK2_RC_FILES /usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
set -gx QT_STYLE_OVERRIDE Breeze

set -gx XDG_CURRENT_DESKTOP sway

set TTY1 (tty)
[ "$TTY1" = "/dev/tty1" ] && exec sway
