vim.o.background = "dark"

require("vscode").setup({
  transparent = false,
  italic_comments = false,
  disable_nvimtree_bg = true,
})

require("lualine").setup {
  options = {
    theme = "vscode"
  }
}
