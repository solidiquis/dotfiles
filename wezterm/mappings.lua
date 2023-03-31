local wezterm = require("wezterm")
local action = wezterm.action

local M = {}

-- Keys
-- 1. Pane and tab management
-- 2. Window and font sizing

-- Key tables
-- 1. Search mode

function M.update_config(config)
  config.keys = {
    -----------------------------
    -- Pane and tab management --
    -----------------------------
    {
      key = "d",
      mods = "CMD",
      action = action.SplitPane {
        direction = "Right",
        size = { Percent = 50 },
      },
    },
    {
      key = "e",
      mods = "CMD",
      action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "l",
      mods = "CMD",
      action = action.ActivatePaneDirection("Right")
    },
    {
      key = "h",
      mods = "CMD",
      action = action.ActivatePaneDirection("Left")
    },
    {
      key = "k",
      mods = "CMD",
      action = action.ActivatePaneDirection("Up")
    },
    {
      key = "j",
      mods = "CMD",
      action = action.ActivatePaneDirection("Down")
    },
    {
      key = "w",
      mods = "CMD",
      action = action.CloseCurrentPane({ confirm = false })
    },
    {
      key = "w",
      mods = "CMD|SHIFT",
      action = action.CloseCurrentTab({ confirm = true })
    },
    {
      key = "]",
      mods = "CMD",
      action = action.ActivateTabRelative(1)
    },
    {
      key = "[",
      mods = "CMD",
      action = action.ActivateTabRelative(-1)
    },

    -----------------------------
    -- Window and font sizing ---
    -----------------------------
    {
      key = "f",
      mods = "SHIFT|CMD",
      action = wezterm.action.ToggleFullScreen,
    },
    {
      key = "+",
      mods = "CMD",
      action = wezterm.action.IncreaseFontSize,
    },
    {
      key = "-",
      mods = "CMD",
      action = wezterm.action.DecreaseFontSize,
    },
  }

  config.key_tables = {
    -----------------------------
    ------- Search mode ---------
    -----------------------------
    search_mode = {
      { key = "Enter", mods = "NONE", action = action.CopyMode "PriorMatch" },
      { key = "Enter", mods = "SHIFT", action = action.CopyMode "NextMatch" },
      { key = "Escape", mods = "NONE", action = action.CopyMode "Close" },
      { key = "u", mods = "CTRL", action = action.CopyMode "ClearPattern" },
    }
  }
end

return M
