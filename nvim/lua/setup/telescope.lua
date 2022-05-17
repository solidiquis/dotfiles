require('telescope').setup({
  defaults = {
    layout_strategy = "vertical"
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
