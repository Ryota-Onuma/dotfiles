syntax on
set shell=/bin/zsh
set shiftwidth=4
set expandtab
set tabstop=4
set textwidth=0
set autoindent
set clipboard=unnamed

call plug#begin()
Plug 'ntk148v/vim-horizon'
Plug 'preservim/nerdtree'
call plug#end()

nnoremap <C-n> :NERDTree<CR>

set termguicolors

colorscheme horizon

let g:lightline = {}
let g:lightline.colorscheme = 'horizon'
