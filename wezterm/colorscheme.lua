local wezterm = require("wezterm")

local M = {}

M.ColorMode = {
    Light = "Modus Operandi",
    Dark = "Custom Gruvbox",
}

function M.update_config(config)
    config.color_schemes = config.color_schemes or {}

    local custom_dark_gruvbox = wezterm.color.get_builtin_schemes()["Gruvbox dark, hard (base16)"]
    custom_dark_gruvbox.background = "#1c1c1c"
    config.color_schemes = {
      [M.ColorMode.Dark] = custom_dark_gruvbox,
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
