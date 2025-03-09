local mode = os.getenv("LIGHT_MODE")

if mode and string.len(mode) > 0 then
  vim.g.everforest_background = "medium"
  vim.o.background = "light"
else
  vim.g.everforest_background = "hard"
  vim.o.background = "dark"
end

vim.g.everforest_enable_italic = 0
vim.g.everforest_disable_italic_comment = 1

require("lualine").setup {
  options = {
    theme = 'everforest'
  }
}

vim.cmd("colorscheme everforest")
