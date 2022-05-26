local mode = require("consts").modes

local function map(mode, mapping, cmd, options)
  local opts = { noremap = true }
  if options then
    opts = vim.tbl_extend("force", opts, options)
  end

  vim.api.nvim_set_keymap(mode, mapping, cmd, opts)
end

vim.g.mapleader = " "

-- Pane navigation
map(mode.normal, "<C-j>", "<C-w><C-j>")
map(mode.normal, "<C-k>", "<C-w><C-k>")
map(mode.normal, "<C-l>", "<C-w><C-l>")
map(mode.normal, "<C-h>", "<C-w><C-h>")

-- Equalize pane widths
map(mode.normal, "<leader>=", "<C-W><C-=>")

-- copy/paste
map(mode.visual_select, '<leader>c', '"*yy<CR>')
map(mode.visual_select, '<leader>v', '"+p<CR>')
map(mode.normal, '<leader>v', '"+p<CR>')

-- Tab nav
map(mode.normal, "<leader>n", "gt")
map(mode.normal, "<leader>N", "gT")

-- Nvim-tree
map(mode.normal, "<leader>e", ":NvimTreeToggle<CR>")

-- Telescope
map(mode.normal, "<leader>p", ":Telescope find_files hidden=true<CR>")
map(mode.normal, "<leader>f", ":Telescope live_grep<CR>")
map(mode.normal, "<leader>s", ":Telescope grep_string<CR>")
map(mode.normal, "<leader>b", ":Telescope buffers<CR>")
map(mode.normal, "<leader>h", ":Telescope help_tags<CR>")

-- Trouble
map(mode.normal, "<leader>dg", ":TroubleToggle<CR>")

-- Terminal
map(mode.terminal, "<C-j>", [[<C-\><C-n><C-j>]])
map(mode.terminal, "<C-k>", [[<C-\><C-n><C-w>k]])
map(mode.terminal, "<C-l>", [[<C-\><C-n><C-l>]])
map(mode.terminal, "<C-h>", [[<C-\><C-n><C-h>]])
