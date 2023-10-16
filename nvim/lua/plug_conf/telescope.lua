local mode = require("consts").modes
local telescope = require("telescope")

telescope.setup({
  defaults = {
    layout_strategy = "vertical",
    layout_config = { preview_cutoff = 0 },
    file_ignore_patterns = {
      "%.git/",
    }
  },
  pickers = {
    lsp_references = { fname_width = 200 },
    buffers = {
      sort_lastused = true,
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        }
      }
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case"
    }
  }
})

telescope.load_extension("fzf")

vim.keymap.set(mode.normal, "<leader>p", ":Telescope find_files hidden=true<CR>", { noremap = true })
vim.keymap.set(mode.normal, "<leader>f", ":Telescope live_grep<CR>", { noremap = true })
vim.keymap.set(mode.normal, "<leader>s", ":Telescope grep_string<CR>", { noremap = true })
vim.keymap.set(mode.normal, "<leader>b", ":Telescope buffers<CR>", { noremap = true })
vim.keymap.set(mode.normal, "<leader>h", ":Telescope help_tags<CR>", { noremap = true })
vim.keymap.set(mode.normal, "gr", ":Telescope lsp_references<CR>", { noremap = true })
vim.keymap.set(mode.normal, "<leader>;", ":Telescope diagnostics<CR>", { noremap = true })
vim.keymap.set(mode.normal, "<leader>g", ":Telescope git_status<CR>", { noremap = true })
