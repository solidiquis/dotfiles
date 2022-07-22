-- Vanilla nvim mappings.. mapping specific to plugins
-- found in setup folders for each respective plugin.

local mode = require("consts").modes
local utils = require("utils")

vim.g.mapleader = " "

-- Pane navigation
utils.map(mode.normal, "<C-j>", "<C-w><C-j>")
utils.map(mode.normal, "<C-k>", "<C-w><C-k>")
utils.map(mode.normal, "<C-l>", "<C-w><C-l>")
utils.map(mode.normal, "<C-h>", "<C-w><C-h>")

-- Equalize pane widths
utils.map(mode.normal, "<leader>=", "<C-W><C-=>")

-- copy/paste
utils.map(mode.visual_select, '<leader>c', '"*yy<CR>')
utils.map(mode.visual_select, '<leader>v', '"+p<CR>')
utils.map(mode.normal, '<leader>v', '"+p<CR>')

-- Convenience
utils.map(mode.normal, "<leader>ts", ":lua toggle_style()<CR>")

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
