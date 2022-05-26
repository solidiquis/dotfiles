-- TODO: leverage new neovim api for autocmds
-- tabs
vim.cmd([[
autocmd BufNewFile,BufRead *.go set filetype=go
autocmd BufNewFile,BufRead *.rs set filetype=rust

autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType ruby :setlocal sw=2 ts=2 sts=2
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
autocmd FileType xml :setlocal sw=2 ts=2 sts=2
autocmd FileType python :setlocal sw=4 ts=4 sts=4
autocmd FileType go :setlocal sw=4 ts=4 sts=4
autocmd FileType rust :setlocal sw=4 ts=4 sts=4

autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
