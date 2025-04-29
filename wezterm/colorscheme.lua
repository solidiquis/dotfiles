local M = {}

M.ColorMode = {
  Light = "zenbones",
  Dark = "zenbones_dark",
}

function M.update_config(config)
  local light_mode = os.getenv("LIGHT_MODE")

  if light_mode and light_mode ~= "" then
    config.color_scheme = M.ColorMode.Light
  else
    config.color_scheme = M.ColorMode.Dark
  end
end

return M
