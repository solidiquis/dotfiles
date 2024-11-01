local M = {}

M.ColorMode = {
  Light = "Gruvbox (Gogh)",
  Dark = "Gruvbox dark, hard (base16)",
}

function M.update_config(config)
  config.color_scheme = M.ColorMode.Dark
end

return M
