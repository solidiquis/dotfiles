require("catppuccin").setup({
  transparent_background = true,
  term_colors = false,
  styles = {
    comments = "italic",
    conditionals = "italic",
    loops = "NONE",
    functions = "NONE",
    keywords = "NONE",
    strings = "NONE",
    variables = "NONE",
    numbers = "NONE",
    booleans = "NONE",
    properties = "NONE",
    types = "NONE",
    operators = "NONE",
  },
})

local Flavour = {
  latte = "latte",
  frappe = "frappe",
  macchiato = "macchiato",
  mocha = "mocha",
}

vim.g.catppuccin_flavour = Flavour.mocha
vim.cmd[[colorscheme catppuccin]]
