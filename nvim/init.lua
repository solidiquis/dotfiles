vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

----------------
--- Mappings ---
----------------
vim.g.mapleader = ' '

-- Pane navigation
local keymap = vim.api.nvim_set_keymap
keymap('n', '<c-h>', '<c-w>h', {})
keymap('n', '<c-j>', '<c-w>j', {})
keymap('n', '<c-k>', '<c-w>k', {})
keymap('n', '<c-l>', '<c-w>l', {})

function test()
  print "hello world"
end

