local M = {}

M.ColorMode = {
  Light = "Tokyo Night Day",
  Dark = "Tokyo Night",
}

function M.update_config(config)
  config.color_scheme = M.ColorMode.Dark
end

return M
