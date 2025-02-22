local M = {}

M.ColorMode = {
  Light = "dayfox",
  Dark = "terafox",
}

function M.update_config(config)
  config.color_scheme = M.ColorMode.Dark
end

return M
