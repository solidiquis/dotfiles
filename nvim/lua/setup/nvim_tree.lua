require'nvim-tree'.setup {
  auto_reload_on_write = true,
  resize_window = true,
  sort_by = "name",
  view = {
    mappings = {
      custom_only = false,
      list = {
        { key = "<C-v>",   action = "vsplit" },
        { key = "<C-x>",   action = "split" },
        { key = "<C-t>",   action = "tabnew" },
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
      },
    },
  }
}
