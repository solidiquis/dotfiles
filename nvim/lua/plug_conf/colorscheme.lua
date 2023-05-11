local lualine = require("lualine")
--local colorscheme = require("tokyonight")

vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "original"
vim.g.gruvbox_material_transparent_background = 1


lualine.setup {
  options = {
    theme = "gruvbox-material"
  }
}

vim.cmd [[ colorscheme gruvbox-material ]]
