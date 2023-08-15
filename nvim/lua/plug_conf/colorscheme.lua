local lualine = require("lualine")

require("nightfox").setup({
  options = {
    transparent = false,
    terminal_colors = false,
  }
})

lualine.setup {
  options = {
    theme = "carbonfox"
  }
}

vim.cmd[[colorscheme carbonfox]]
