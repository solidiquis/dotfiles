local mode = require("consts").modes
local map = require("utils").map
local telescope = require("telescope")

telescope.setup({
  defaults = {
    layout_strategy = "vertical",
    file_ignore_patterns = {
      "%.git/",
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

map(mode.normal, "<leader>p", ":Telescope find_files hidden=true<CR>")
map(mode.normal, "<leader>f", ":Telescope live_grep<CR>")
map(mode.normal, "<leader>s", ":Telescope grep_string<CR>")
map(mode.normal, "<leader>b", ":Telescope buffers<CR>")
map(mode.normal, "<leader>h", ":Telescope help_tags<CR>")
map(mode.normal, "<leader>r", ":Telescope lsp_references<CR>")
map(mode.normal, "<leader>;", ":Telescope diagnostics<CR>")
map(mode.normal, "<leader>d", ":Telescope lsp_definitions<CR>")
