local M = {}

function M.update_config(config)
  config.window_background_opacity = 1.00
  config.macos_window_background_blur = 30

  config.initial_rows = 25
  config.initial_cols = 100

  config.scrollback_lines = 10000
  config.enable_tab_bar = true
  config.hide_tab_bar_if_only_one_tab = true
end

return M
