local mode = os.getenv("LIGHT_MODE")

vim.o.termguicolors = true

if mode and string.len(mode) > 0 then
  vim.g.zenwritten = {
    lightness = 'bright',
    italic_comments = false,
  }
  vim.o.background = "light"

  vim.cmd("colorscheme zenwritten")
else
  vim.o.background = "dark"
  vim.cmd("colorscheme monoglow")
end
