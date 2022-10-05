local winsize = require("utils").winsize
local mode = require("consts").modes
local map = require("utils").map
local nvim_tree_events = require("nvim-tree.events")
local bufferline_api = require("bufferline.api")

local DEFAULT_WIDTH = 30

local function inc_width()
  local width, _height = winsize()
  local new_width = width + 10

  vim.cmd(string.format("NvimTreeResize %d", new_width))
end

local function dec_width()
  local width, _height = winsize()

  local new_width = width - 10

  if new_width < DEFAULT_WIDTH then return end

  vim.cmd(string.format("NvimTreeResize %d", new_width))
end

require("nvim-tree").setup {
  auto_reload_on_write = true,
  update_focused_file = {
    enable = true
  },
  sort_by = "name",
  filters = {
    custom = {
      ".git"
    }
  },
  renderer = {
    highlight_opened_files = "name",
  },
  view = {
    side = "left",
    adaptive_size = true,
    centralize_selection = true,
    width = DEFAULT_WIDTH,
    mappings = {
      custom_only = false,
      list = {
        { key = "<C-v>",   action = "vsplit" },
        { key = "<C-x>",   action = "split" },
        { key = "r",       action = "refresh" },
        { key = "a",       action = "create" },
        { key = "d",       action = "remove" },
        { key = "m",       action = "rename" },
        { key = "y",       action = "copy_name" },
        { key = "Y",       action = "copy_path" },
        { key = "gy",      action = "copy_absolute_path" },
        { key = "q",       action = "close" },
        { key = "W",       action = "collapse_all" },
        { key = "S",       action = "search_node" },
        { key = "<C-k>",   action = "toggle_file_info" },
        { key = ">",       action = "more_wide", action_cb = inc_width },
        { key = "<",       action = "less_wide", action_cb = dec_width },
      },
    },
  }
}

nvim_tree_events.on_tree_resize(function (new_size)
  bufferline_api.set_offset(new_size, "File Tree")
end)

map(mode.normal, "<leader>e", ":NvimTreeToggle<CR>")
