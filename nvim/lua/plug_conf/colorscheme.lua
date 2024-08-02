require("cyberdream").setup({
  transparent = false,
  italic_comments = false,
  hide_fillchars = false,
  borderless_telescope = false,
  terminal_colors = true,
  theme = {
    variant = "auto",
  },

  extensions = {
    telescope = true,
  },
})

require('lualine').setup({
  options = {
    theme = "auto",
  },
})
vim.cmd("colorscheme cyberdream")
