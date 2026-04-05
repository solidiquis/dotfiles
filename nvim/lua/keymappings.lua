vim.g.mapleader = " "

-- Pane navigation
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { noremap = true })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { noremap = true })

-- Equalize pane widths
vim.keymap.set("n", "<leader>=", "<C-W><C-=>", { noremap = true })

-- copy/paste
vim.keymap.set("v", '<leader>c', '"*yy<CR>', { noremap = true })
vim.keymap.set("v", '<leader>v', '"+p<CR>', { noremap = true })
vim.keymap.set("n", '<leader>v', '"+p<CR>', { noremap = true })

-- Treesitter
vim.keymap.set("x", "+", "an", { remap = true, desc = "Increment selection (outer node)" })
vim.keymap.set("x", "_", "in", { remap = true, desc = "Decrement selection (inner node)" })

-- Misc
vim.keymap.set("n", "=", ":lua update_buf_width(2)<CR>", { noremap = true })
vim.keymap.set("n", "-", ":lua update_buf_width(-2)<CR>", { noremap = true })
--vim.keymap.set("n", "+", ":lua update_buf_height(2)<CR>", { noremap = true })
--vim.keymap.set("n", "_", ":lua update_buf_height(-2)<CR>", { noremap = true })
vim.keymap.set("n", "<C-;>", ":LU<CR>", { noremap = true })
