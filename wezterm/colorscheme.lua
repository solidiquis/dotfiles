local M = {}

M.ColorMode = {
  Light = "Github",
  Dark = "Github Dark (Gogh)",
}

function M.update_config(config)
  config.color_scheme = M.ColorMode.Dark
end

return M
