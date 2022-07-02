-- Vanilla nvim mappings.. mapping specific to plugins
-- found in setup folders for each respective plugin.

local mode = require("consts").modes
local map = require("utils").map

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

-- Terminal buffer-scoped maps
function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, mode.terminal, "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, mode.terminal, "<C-j>", [[<C-\><C-n><C-j>]], opts)
  vim.api.nvim_buf_set_keymap(0, mode.terminal, "<C-k>", [[<C-\><C-n><C-w>k]], opts)
  vim.api.nvim_buf_set_keymap(0, mode.terminal, "<C-l>", [[<C-\><C-n><C-l>]], opts)
  vim.api.nvim_buf_set_keymap(0, mode.terminal, "<C-h>", [[<C-\><C-n><C-h>]], opts)
end

vim.cmd [[ autocmd TermOpen term://* lua set_terminal_keymaps() ]]
