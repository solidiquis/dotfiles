vim.g.gruvbox_material_enable_italic = 0
vim.g.gruvbox_material_transparent_background = 0
vim.g.gruvbox_material_dim_inactive_windows = 0
local mode = os.getenv("LIGHT_MODE")

if mode and string.len(mode) > 0 then
  vim.g.gruvbox_material_background = "medium"
  vim.g.gruvbox_material_foreground = "hard"
  vim.o.background = "light"
else
  vim.g.gruvbox_material_background = "hard"
  vim.g.gruvbox_material_foreground = "hard"
  vim.o.background = "dark"
end

require("lualine").setup {
  options = {
    theme = "gruvbox-material"
  }
}

vim.cmd("colorscheme gruvbox-material")
