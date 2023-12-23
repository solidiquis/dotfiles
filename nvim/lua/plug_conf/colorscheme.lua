vim.o.background = "dark" -- or "light" for light mode
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[
  let g:gruvbox_material_background= 'hard'
  let g:gruvbox_material_transparent_background=2
  let g:gruvbox_material_diagnostic_line_highlight=1
  let g:gruvbox_material_diagnostic_virtual_text='colored'
  let g:gruvbox_material_enable_bold=0
  let g:gruvbox_material_enable_italic=0
]])
vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })

require("lualine").setup {
  options = {
    theme = 'gruvbox-material'
  }
}

vim.cmd([[colorscheme gruvbox-material]]) -- Set color scheme
