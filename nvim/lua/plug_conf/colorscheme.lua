local mode = os.getenv("LIGHT_MODE")

require("github-theme").setup({
  options = {
    compile_path = vim.fn.stdpath("cache") .. "/github-theme",
    compile_file_suffix = "_compiled",
    hide_end_of_buffer = true,
    hide_nc_statusline = true,
    transparent = true,
    terminal_colors = true,
    dim_inactive = false,
    module_default = true,
    styles = {
      comments = "NONE",
      functions = "NONE",
      keywords = "NONE",
      variables = "NONE",
      conditionals = "NONE",
      constants = "NONE",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
    },
    inverse = {
      match_paren = false,
      visual = false,
      search = false,
    },
    darken = {
      floats = true,
      sidebars = {
        enable = true,
        list = {},
      },
    },
    modules = {},
  },
  palettes = {},
  specs = {},
  groups = {},
})

if mode and string.len(mode) > 0 then
  vim.o.background = "light"
  vim.cmd("colorscheme github_light_high_contrast")
else
  vim.o.background = "dark"
  vim.cmd("colorscheme github_dark_default")
end

require("lualine").setup({})
