local lualine = require("lualine")
local colorscheme = require("nightfox")

colorscheme.setup({
  options = {
    transparent = true
  }
})

lualine.setup {
  options = {
    theme = "carbonfox"
  }
}

vim.cmd[[ colorscheme carbonfox ]]
