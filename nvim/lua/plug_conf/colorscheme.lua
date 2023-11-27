require("tokyonight").setup({
  style = "night",
  light_style = "day",
  transparent = true,
  terminal_colors = true,
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
    functions = {},
    variables = {},
    sidebars = "dark",
    floats = "dark",
  },
  sidebars = { "qf", "help" },
  hide_inactive_statusline = false,
  dim_inactive = false,
  lualine_bold = false,
})

require("lualine").setup {
  options = {
    theme = 'tokyonight'
  }
}

vim.cmd[[colorscheme tokyonight]]
