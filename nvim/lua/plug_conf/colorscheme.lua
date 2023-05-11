local lualine = require("lualine")
--local colorscheme = require("tokyonight")

vim.g.gruvbox_material_background = "hard"

lualine.setup {
  options = {
    theme = "gruvbox-material"
  }
}

vim.cmd [[ colorscheme gruvbox-material ]]
