require('telescope').setup({
  defaults = {
    layout_strategy = "vertical",
    file_ignore_patterns = {
      ".git",
    }
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        }
      }
    },
  },
})
