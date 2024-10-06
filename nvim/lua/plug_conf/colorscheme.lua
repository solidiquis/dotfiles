require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    transparent = false,
    terminal_colors = true,
    dim_inactive = false,
    module_default = true,
    colorblind = {
      enable = false,
      simulate_only = false,
      severity = {
        protan = 0,
        deutan = 0,
        tritan = 0,
      },
    },
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
    modules = {
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})

local mode = os.getenv("LIGHT_MODE")

if mode and string.len(mode) > 0 then
  vim.cmd("colorscheme dayfox")
  require("lualine").setup {
    options = {
      theme = "dayfox"
    }
  }
else
  vim.cmd("colorscheme carbonfox")
  require("lualine").setup {
    options = {
      theme = "carbonfox"
    }
  }
end
