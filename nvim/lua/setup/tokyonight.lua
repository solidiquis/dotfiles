local theme_styles = {
  night = "night",
  day = "day",
  storm = "storm"
}

vim.g.tokyonight_style = theme_styles.night
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_italic_comments = false
vim.g.tokyonight_italic_keywords = false
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_italic_variables = false

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]

return theme_styles
