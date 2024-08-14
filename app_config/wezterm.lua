local wezterm = require 'wezterm'

return {
  term = 'wezterm',

  font = wezterm.font("JetBrains Mono"),
  -- font = wezterm.font_with_fallback({"JetBrainsMono Nerd Font", "Symbols Nerd Font Mono"}),
  font_size = 10,
  color_scheme = "Edge Light (base16)",

  cursor_blink_rate = 0,

  hide_tab_bar_if_only_one_tab = true,
}
