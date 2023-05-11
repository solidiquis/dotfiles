local lualine = require("lualine")
--local colorscheme = require("tokyonight")

vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "original"
vim.g.gruvbox_material_transparent_background = 1

local error_float = vim.api.nvim_get_hl(0, { name = "ErrorFloat" })
error_float.bg = nil
error_float.ctermbg = nil

vim.api.nvim_set_hl(0, "ErrorFloat", error_float)

lualine.setup {
  options = {
    theme = "gruvbox-material"
  }
}

vim.cmd [[ colorscheme gruvbox-material ]]
