local style = {
  night = "night",
  storm = "storm",
  day = "day"
}

vim.g.tokyonight_style = style.night
vim.g.tokyonight_italic_comments = false
vim.g.tokyonight_italic_keywords = false
vim.g.tokyonight_dark_sidebar = false

require("lualine").setup {
  options = {
    theme = "tokyonight"
  }
}

vim.cmd[[colorscheme tokyonight]]
