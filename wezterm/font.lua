local wezterm = require("wezterm")

local M = {}

function M.update_config(config)
  config.line_height = 1.5
  config.cell_width = 1.0
  config.font = wezterm.font_with_fallback {
    { family = "RobotoMono Nerd Font Mono", weight = "Bold", italic = false },
    { family = "JetBrains Mono", weight = "Bold", italic = false },
  }
  config.font_size = 12.0
end

return M
