local wezterm = require 'wezterm';

return {
  window_background_opacity = 0.9,
  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  color_scheme = "Gruvbox Dark",
  colors = {
    -- The default text color
    foreground = "#ebdbb2",
    -- The default background color
    background = "#000000",
    -- Overrides the cell background color when the current cell is occupied by the cursor
    cursor_bg = "#fe8019",
    -- Specifies the border color of the cursor cell when the mode is set to Block
    cursor_border = "#fe8019",
    -- Specifies the color of the scrollbar "thumb"; the portion that represents the current viewport
    scrollbar_thumb = "#504945",
    -- Specifies the color of the split lines between panes
    split = "#504945",

    -- The color of the line that is drawn under the cursor
    cursor_fg = "#928374",
    selection_bg = "#3c3836",
    selection_fg = "#ebdbb2",

    -- An array of 16 colors that are used in order to render ANSI colors
    ansi = { "#282828", "#cc241d", "#98971a", "#d79921", "#458588", "#b16286", "#689d6a", "#a89984" },
    brights = { "#928374", "#fb4934", "#b8bb26", "#fabd2f", "#83a598", "#d3869b", "#8ec07c", "#ebdbb2" },
  },
  -- background = {
  --   {
  --     source = {
  --       File = "/Users/furkan/bestone.png",
  --     },
  --     attachment = "Fixed",
  --     opacity = 1.0,
  --   },
  -- },

  keys = {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    { key = "LeftArrow",  mods = "OPT", action = wezterm.action { SendString = "\x1bb" } },
    -- Make Option-Right equivalent to Alt-f; forward-word
    { key = "RightArrow", mods = "OPT", action = wezterm.action { SendString = "\x1bf" } },
  },

  font = wezterm.font("JetBrains Mono"),
  font_size = 18.0,
}
