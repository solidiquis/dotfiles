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

  require("noirbuddy").setup {
    preset = "minimal",
    styles = {
      italic = false,
      bold = false,
      underline = false,
      undercurl = false,
    },
  }
end
