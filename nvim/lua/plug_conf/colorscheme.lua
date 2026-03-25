local mode = os.getenv("LIGHT_MODE")

vim.o.termguicolors = true

require("gruvbox").setup({
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = false,
  italic = {
    strings = false,
    emphasis = false,
    comments = false,
    operators = false,
    folds = false,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  inverse = true,
  contrast = "hard",
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})



if mode and string.len(mode) > 0 then
  vim.o.background = "light"
  vim.cmd("colorscheme gruvbox")
else
  vim.o.background = "dark"
  vim.cmd("colorscheme gruvbox")
end

vim.cmd("highlight! link SignColumn Normal")

require("lualine").setup({})
