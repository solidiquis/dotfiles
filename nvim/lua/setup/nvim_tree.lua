local winsize = require("utils").winsize

local function inc_width()
  local width, _height = winsize()
  vim.cmd(string.format("NvimTreeResize %d", width + 10))
end

local function dec_width()
  local width, _height = winsize()

  local new_width = width - 10

  if new_width < 30 then return end

  vim.cmd(string.format("NvimTreeResize %d", width - 10))
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
