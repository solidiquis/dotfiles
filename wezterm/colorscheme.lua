local M = {}

M.ColorMode = {
  Light = "light",
  Dark = "dark",
}

function M.update_config(config)
  config.color_schemes = config.color_schemes or {}

  -- Custom Light Theme
  config.color_schemes["light"] = {
    foreground = "#353535",
    background = "#f7f6f6",
    cursor_fg = "#EEEEEE",
    cursor_bg = "#353535",
    cursor_border = "#EEEEEE",
    selection_fg = "#353535",
    selection_bg = "#D7D7D7",
    ansi = {
      "#EEEEEE", "#A8334C", "#4F6C31", "#944927",
      "#286486", "#88507D", "#3B8992", "#353535"
    },
    brights = {
      "#C6C3C3", "#94253E", "#3F5A22", "#803D1C",
      "#1D5573", "#7B3B70", "#2B747C", "#5C5C5C"
    },
  }

  -- Custom Dark Theme
  config.color_schemes["dark"] = {
    foreground = "#BBBBBB",
    background = "#121212",
    cursor_fg = "#191919",
    cursor_bg = "#C9C9C9",
    cursor_border = "#191919",
    selection_fg = "#BBBBBB",
    selection_bg = "#404040",
    ansi = {
      "#191919", "#DE6E7C", "#819B69", "#B77E64",
      "#6099C0", "#B279A7", "#66A5AD", "#BBBBBB"
    },
    brights = {
      "#3D3839", "#E8838F", "#8BAE68", "#D68C67",
      "#61ABDA", "#CF86C1", "#65B8C1", "#8E8E8E"
    },
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
