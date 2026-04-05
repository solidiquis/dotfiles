require("barbar").setup({})

-- Nuke the File Tree tab when it closes
vim.api.nvim_create_autocmd('BufWinLeave', {
    pattern = '*',
    callback = function()
        if vim.fn.expand('<afile>'):match('NvimTree') then
            require("bufferline.api").set_offset(0)
        end
    end,
})

vim.keymap.set("n", "<leader>n", "<CMD>BufferNext<CR>", { noremap = true })
vim.keymap.set("n", "<leader>N", "<CMD>BufferPrevious<CR>", { noremap = true })
vim.keymap.set("n", "<leader>q", "<CMD>BufferClose<CR>", { noremap = true })
