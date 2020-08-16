" ============ "
" ===Basics=== "
" ============ "
syntax on
set noerrorbells 
set expandtab 
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set autoindent
set clipboard+=unnamedplus

set sw=4 ts=4 sts=4 " Default
autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType ruby :setlocal sw=2 ts=2 sts=2

" Make vertical separator pretty
highlight VertSplit cterm=NONE
set fillchars+=vert:\▏

" ============== "
" ===Mappings=== "
" ============== "
let mapleader = " "

" Things I miss from VSCode
noremap <leader>p :Files<cr>
noremap <leader>f :Ag<cr>
noremap <leader>e :NERDTreeToggle<cr>
noremap <leader>b :Buffers<cr>

" Pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ============="
" ===Plugins==="
" ============="
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    Plug 'jremmen/vim-ripgrep'
    Plug 'ggreer/the_silver_searcher'
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-fugitive'
call plug#end()

