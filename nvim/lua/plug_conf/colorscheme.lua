local mode = os.getenv("LIGHT_MODE")

vim.o.termguicolors = true

if mode and string.len(mode) > 0 then
  vim.g.zenwritten = {
    lightness = 'bright',
    italic_comments = false,
  }
  vim.o.background = "light"
else
  vim.g.zenwritten = {
    darkness = 'stark',
    italic_comments = false,
  }
  vim.o.background = "dark"
end

vim.cmd("colorscheme zenwritten")
