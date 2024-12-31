require("tokyonight").setup {
  style = "night",
  light_style = "day",
  transparent = false,
  terminal_colors = true,
  styles = {
    sidebars = "dark",
    floats = "dark",
  },
  day_brightness = 0.3,
  dim_inactive = false,
  lualine_bold = false,

  on_colors = function(colors) end,
  plugins = {
    all = package.loaded.lazy == nil,
    auto = true,
  },
}

local mode = os.getenv("LIGHT_MODE")

if mode and string.len(mode) > 0 then
  vim.o.background = "light"
  vim.cmd("colorscheme tokyonight-day")

  require('lualine').setup {
    options = {
      theme = 'tokyonight-day'
    }
  }
else
  vim.o.background = "dark"
  vim.cmd("colorscheme tokyonight")

  require('lualine').setup {
    options = {
      theme = 'tokyonight'
    }
  }
end

