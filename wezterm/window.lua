local M = {}

function M.update_config(config)
  config.window_background_opacity = 0.8
  config.macos_window_background_blur = 20

  config.initial_rows = 25
  config.initial_cols = 100

  config.scrollback_lines = 10000
end

return M
