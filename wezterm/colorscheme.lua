local M = {}

--M.ColorMode = {
  --Light = "Modus Vivendi",
  --Dark = "Modus Operandi",
--}
--

M.ColorMode = {
  Light = "Gruvbox light, hard (base16)",
  Dark = "Gruvbox dark, hard (base16)",
}

function M.update_config(config)
  config.color_schemes = config.color_schemes or {}

  -- Switch based on environment
  local light_mode = os.getenv("LIGHT_MODE")
  if light_mode and light_mode ~= "" then
    config.color_scheme = M.ColorMode.Light
  else
    config.color_scheme = M.ColorMode.Dark
  end
end

return M
