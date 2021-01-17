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
set laststatus=2

" Tabs
set sw=4 ts=4 sts=4 " Default
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
autocmd FileType typescript.tsx :setlocal sw=2 ts=2 sts=2
autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType ruby :setlocal sw=2 ts=2 sts=2
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
autocmd FileType xml :setlocal sw=2 ts=2 sts=2

" Make vertical separator pretty
highlight VertSplit cterm=NONE
set fillchars+=vert:\▏

" Get rid of unnecessary highlight for spelling
highlight clear SpellBad

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

" Copy to system clipboard
noremap <leader>c "*yy<cr>

" Paste without indent
noremap<leader>v "+p<cr>

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

    " JavaScript
    Plug 'pangloss/vim-javascript'
    Plug 'maxmellon/vim-jsx-pretty'

    " Styled-components
    Plug 'styled-components/vim-styled-components' 

    " Go
    Plug 'fatih/vim-go'

    " Rust
    Plug 'rust-lang/rust.vim'

    " Prettifier
    Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript'] }

call plug#end()

" ============="
" PluginConfigs"
" ============="

" vim-jsx-pretty
hi jsxAttrib ctermfg=3*
hi jsxComponentName ctermfg=4*
hi jsxTagName ctermfg=4*
hi jsxPunct ctermfg=3*
hi jsObjectProp ctermfg=3*
hi jsxCloseString ctermfg=3*

" vim-go
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

" vim-prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" ============="
" ==CustomCmds="
" ============="

" Absolute path of open file to clipboard
function! Cwf()
    let @+=expand('%:p')
endfunction
command! Cwf call Cwf()

" Relative path of open file to clipboard
function! Cwfr()
    let @+=expand('%')
endfunction
command! Cwfr call Cwfr()

" ex) :Tag h1
function! Tag(name)
    let @"="<" . a:name . "></" . a:name . ">"
    normal! pbbl
    startinsert
endfunction
command! -nargs=1 Tag call Tag(<f-args>)

" ex) :Jtag HelloWorld
function! Jtag(name)
    let @"="<" . a:name . " />"
    normal! pb
    startinsert
endfunction
command! -nargs=1 Jtag call Jtag(<f-args>)

