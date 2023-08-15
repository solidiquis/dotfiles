local wezterm = require("wezterm")

local M = {}

function M.update_config(config)
  config.line_height = 1.2
  config.cell_width = 0.95
  config.font = wezterm.font_with_fallback {
    { family = "SauceCodePro NF", weight = "Medium" },
    { family = "JetBrains Mono", weight = "Medium" },
  }
  config.font_size = 13.0
end

return M
