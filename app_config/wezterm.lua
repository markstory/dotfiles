local wezterm = require 'wezterm'

return {
  term = 'wezterm',

  font = wezterm.font "JetBrains Mono",
  font_size = 13,
  color_scheme = "Edge Light (base16)",

  cursor_blink_rate = 0,

  hide_tab_bar_if_only_one_tab = true,
}
