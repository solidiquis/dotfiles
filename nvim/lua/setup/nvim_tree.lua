local winsize = require("utils").winsize
local nvim_tree_events = require("nvim-tree.events")
local bufferline_state = require("bufferline.state")

local DEFAULT_WIDTH = 30

local function inc_width()
  local width, _height = winsize()
  local new_width = width + 10

  vim.cmd(string.format("NvimTreeResize %d", new_width))
  bufferline_state.set_offset(new_width, "File Tree")
end

local function dec_width()
  local width, _height = winsize()

  local new_width = width - 10

  if new_width < DEFAULT_WIDTH then return end

  vim.cmd(string.format("NvimTreeResize %d", new_width))
  bufferline_state.set_offset(new_width, "File Tree")
end

require'nvim-tree'.setup {
  auto_reload_on_write = true,
  sort_by = "name",
  filters = {
    custom = {
      ".git"
    }
  },
  view = {
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

nvim_tree_events.on_tree_open(function ()
  bufferline_state.set_offset(DEFAULT_WIDTH, "File Tree")
end)

nvim_tree_events.on_tree_close(function ()
  bufferline_state.set_offset(0)
end)
