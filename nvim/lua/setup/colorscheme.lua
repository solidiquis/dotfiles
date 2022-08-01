local style = {
  night = "night",
  storm = "storm",
  day = "day"
}

vim.g.tokyonight_style = style.night
vim.g.tokyonight_italic_comments = false
vim.g.tokyonight_italic_keywords = false
vim.g.tokyonight_dark_sidebar = false
vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_dark_float = true

require("lualine").setup {
  options = {
    theme = "tokyonight"
  }
}

vim.cmd[[colorscheme tokyonight]]
