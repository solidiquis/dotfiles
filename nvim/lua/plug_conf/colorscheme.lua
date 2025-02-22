require("nightfox").setup({
  options = {
    transparent = false,
    styles = {
      comments = "NONE",
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = {
      match_paren = false,
      visual = false,
      search = false,
    },
  },
})


local mode = os.getenv("LIGHT_MODE")

if mode and string.len(mode) > 0 then
  vim.o.background = "light"
  vim.cmd("colorscheme dayfox")

  require("lualine").setup {
    options = {
      theme = "dayfox"
    }
  }
else
  vim.o.background = "dark"
  vim.cmd("colorscheme terafox")

  require("lualine").setup {
    options = {
      theme = 'terafox'
    }
  }
end

