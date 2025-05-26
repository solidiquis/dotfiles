local mode = os.getenv("LIGHT_MODE")

vim.o.termguicolors = true

if mode and string.len(mode) > 0 then
  vim.o.background = "light"
  require("github-theme").setup({
    options = {
      transparent = true,
    },
  })
  vim.cmd("colorscheme github_light_high_contrast")
else
  vim.o.background = "dark"
  require("cyberdream").setup({})
  vim.cmd("colorscheme cyberdream")
end
