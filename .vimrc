" ============ "
" ===Basics=== "
" ============ "
syntax on
set noerrorbells 
set belloff=all
set expandtab 
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set autoindent

set sw=4 ts=4 sts=4 " Default
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
autocmd FileType typescript.tsx :setlocal sw=2 ts=2 sts=2
autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType ruby :setlocal sw=2 ts=2 sts=2
autocmd FileType xml :setlocal sw=2 ts=2 sts=2

" Make vertical separator pretty
highlight VertSplit cterm=NONE
set fillchars+=vert:\▏

" Line number styling
highlight LineNr ctermfg=darkgrey

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
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" Copy to clipboard
noremap <leader>c "*yy<cr>

" Status-line styles
hi StatusLine ctermbg=000000 ctermfg=000000

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
    Plug 'preservim/nerdcommenter'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " CoffeeScript
    Plug 'kchmck/vim-coffee-script'

    " Go
    Plug 'fatih/vim-go'
call plug#end()

" Go goodness
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1
