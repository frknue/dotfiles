-- return {
--   "folke/tokyonight.nvim",
--   priority = 1000,
--   config = function()
--     local transparent = true -- set to true if you would like to enable transparency
--
--     local bg = "#011628"
--     local bg_dark = "#011423"
--     local bg_highlight = "#143652"
--     local bg_search = "#0A64AC"
--     local bg_visual = "#275378"
--     local fg = "#CBE0F0"
--     local fg_dark = "#B4D0E9"
--     local fg_gutter = "#627E97"
--     local border = "#547998"
--
--     require("tokyonight").setup({
--       style = "night",
--       transparent = transparent,
--       styles = {
--         sidebars = transparent and "transparent" or "dark",
--         floats = transparent and "transparent" or "dark",
--       },
--       on_colors = function(colors)
--         colors.bg = bg
--         colors.bg_dark = transparent and colors.none or bg_dark
--         colors.bg_float = transparent and colors.none or bg_dark
--         colors.bg_highlight = bg_highlight
--         colors.bg_popup = bg_dark
--         colors.bg_search = bg_search
--         colors.bg_sidebar = transparent and colors.none or bg_dark
--         colors.bg_statusline = transparent and colors.none or bg_dark
--         colors.bg_visual = bg_visual
--         colors.border = border
--         colors.fg = fg
--         colors.fg_dark = fg_dark
--         colors.fg_float = fg
--         colors.fg_gutter = fg_gutter
--         colors.fg_sidebar = fg_dark
--       end,
--     })
--
--     vim.cmd("colorscheme tokyonight")
--   end,
-- }

return {
  "ellisonleao/gruvbox.nvim",
  config = function()
    require("gruvbox").setup({
      terminal_colors = true,
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines, and errors
      contrast = "soft", -- can be "hard", "soft" or empty string
      transparent_mode = true, -- enable transparency
      palette_overrides = {
        bg = "#011628",
        bg_dark = "#011423",
        bg_highlight = "#143652",
        bg_visual = "#275378",
        fg = "#CBE0F0",
        fg_dark = "#B4D0E9",
        fg_gutter = "#627E97",
        border = "#547998",
      },
      overrides = {
        Normal = { bg = "none" }, -- Transparent background
        NormalFloat = { bg = "none" }, -- Transparent background for floating windows
        LineNr = { fg = "#627E97" },
        CursorLineNr = { fg = "#CBE0F0", bold = true },
        Visual = { bg = "#275378" },
        Search = { bg = "#0A64AC", fg = "#CBE0F0" },
        StatusLine = { bg = "none", fg = "#B4D0E9" },
        VertSplit = { fg = "#547998" },
      },
    })
    vim.cmd("colorscheme gruvbox")
  end,
}
