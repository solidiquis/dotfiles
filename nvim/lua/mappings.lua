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
map(mode.normal, "<C-J>", "<C-W><C-J>")
map(mode.normal, "<C-K>", "<C-W><C-K>")
map(mode.normal, "<C-L>", "<C-W><C-L>")
map(mode.normal, "<C-H>", "<C-W><C-H>")

-- Equalize pane widths
map(mode.normal, "<leader>=", "<C-W><C-=>")

-- copy/paste
map(mode.visual_select, '<leader>c', '"*yy<CR>')
map(mode.visual_select, '<leader>v', 'd"+p<CR>')
map(mode.normal, '<leader>v', '"+p<CR>')

-- Tab nav
map(mode.normal, "<leader>n", "gt")
map(mode.normal, "<leader>N", "gT")

-- NERDTree
map(mode.normal, "<leader>e", ":NERDTreeToggle<CR>")

-- Telescope
map(mode.normal, "<leader>p", ":Telescope find_files hidden=true<CR>")
map(mode.normal, "<leader>f", ":Telescope live_grep<CR>")
map(mode.normal, "<leader>s", ":Telescope grep_string<CR>")
map(mode.normal, "<leader>b", ":Telescope buffers<CR>")
map(mode.normal, "<leader>h", ":Telescope help_tags<CR>")

-- Trouble
map(mode.normal, "<leader>dg", ":TroubleToggle<CR>")
