local M = {}

M.ColorMode = {
  Light = "Github (Gogh)",
  Dark = "dark",
}

function M.update_config(config)
  config.color_schemes = config.color_schemes or {}

  config.color_schemes["dark"] = {
    foreground = "#ffffff",
    background = "#16181a",
    cursor_bg = "#ffffff",
    cursor_fg = "#ffffff",
    cursor_border = "#16181a",
    selection_fg = "#16181a",
    selection_bg = "#5eff6c",
    scrollbar_thumb = "#ffffff",
    split = "#5eff6c",
    ansi = { "#16181a", "#ff5ea0", "#5eff6c", "#ffbd5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
    brights = { "#16181a", "#ff5ea0", "#5eff6c", "#ffbd5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
    indexed = { [16] = "#d17c00", [17] = "#d11500" },
  }

  -- Switch based on environment
  local light_mode = os.getenv("LIGHT_MODE")
  if light_mode and light_mode ~= "" then
    config.color_scheme = M.ColorMode.Light
  else
    config.color_scheme = M.ColorMode.Dark
  end
end

return M
