local M = {}

M.ColorMode = {
  Light = "Everforest Light Medium (Gogh)",
  Dark = "Everforest Dark Hard (Gogh)",
}

function M.update_config(config)
  config.color_scheme = M.ColorMode.Dark
end

return M
