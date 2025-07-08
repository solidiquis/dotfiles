local mode = require("consts").modes
local telescope = require("telescope")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

local select_one_or_multi = function(prompt_bufnr)
  local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    require('telescope.actions').close(prompt_bufnr)
    for _, j in pairs(multi) do
      if j.path ~= nil then
        vim.cmd(string.format('%s %s', 'edit', j.path))
      end
    end
  else
    require('telescope.actions').select_default(prompt_bufnr)
  end
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<CR>'] = select_one_or_multi,
      },
    },
    layout_strategy = "vertical",
    layout_config = { preview_cutoff = 0 },
    file_ignore_patterns = {
      "%.git/",
      "target/",
      "venv/",
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
vim.keymap.set(mode.normal, "<leader>r", ":Telescope command_history<CR>", { noremap = true })
vim.keymap.set(mode.normal, "<leader>P", ":Telescope find_files hidden=true no_ignore=true hidden=true<CR>", { noremap = true })
vim.keymap.set(mode.normal, "<leader>f", ":Telescope live_grep<CR>", { noremap = true })
vim.keymap.set(mode.normal, "<leader>s", ":Telescope grep_string<CR>", { noremap = true })
vim.keymap.set(mode.normal, "<leader>b", ":Telescope buffers<CR>", { noremap = true })
vim.keymap.set(mode.normal, "<leader>h", ":Telescope help_tags<CR>", { noremap = true })
vim.keymap.set(mode.normal, "gr", ":Telescope lsp_references<CR>", { noremap = true })
vim.keymap.set(mode.normal, "<leader>;", ":Telescope diagnostics<CR>", { noremap = true })
vim.keymap.set(mode.normal, "<leader>g", ":Telescope git_status<CR>", { noremap = true })
vim.keymap.set(mode.normal, "<leader>l", function()
  builtin.lsp_document_symbols({ symbol_width = 200 })
end, { noremap = true })
vim.keymap.set(mode.normal, "<leader>/", function()
  builtin.current_buffer_fuzzy_find()
end, { noremap = true })
