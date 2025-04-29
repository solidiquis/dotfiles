local mode = os.getenv("LIGHT_MODE")

vim.o.termguicolors = true

if mode and string.len(mode) > 0 then
  vim.g.zenbones_lightness = 'bright'
  vim.o.background = "light"
else
  vim.g.zenbones_darkness = "stark"
  vim.o.background = "dark"
end

vim.cmd("colorscheme zenwritten")
