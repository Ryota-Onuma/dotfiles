" ----- visual/ -----
syntax on
set number
set noerrorbells
set shell=/bin/zsh
set showmatch matchtime=1
set cinoptions+=:0
set showcmd
set shiftwidth=4
set display=lastline
set list
set showmatch
set cursorline
set autoread
set tabstop=4
set textwidth=0
set expandtab
set clipboard=unnamed
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

execute "set colorcolumn=" . join(range(121, 9999), ',')
" ----- /visual -----


" ----- search/ -----
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch

" minibufexpl
nnoremap <silent> bn :<C-u>:bnext<CR>
nnoremap <silent> b1 :<C-u>:b1<CR>
nnoremap <silent> b2 :<C-u>:b2<CR>
nnoremap <silent> b3 :<C-u>:b3<CR>
nnoremap <silent> b4 :<C-u>:b4<CR>
nnoremap <silent> b5 :<C-u>:b5<CR>
nnoremap <silent> b6 :<C-u>:b6<CR>
nnoremap <silent> b7 :<C-u>:b7<CR>
nnoremap <silent> b8 :<C-u>:b8<CR>
nnoremap <silent> b9 :<C-u>:b9<CR>

" fzf
nnoremap <silent> fzf :Files<CR>
nnoremap <silent> ls :Buffers<CR>

nmap <Space> :Files
" ----- /search -----


" ----- edit/ -----
inoremap jj <Esc>
noremap <Esc><Esc> :noh<CR>
noremap ; :
set clipboard+=unnamedplus
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smartindent
" ----- /edit -----


" ----- control/ ----
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" ----- /control ----


" ----- other/ -----
set ttimeoutlen=10
" ----- /other -----


" ----- dein.vim/ ------
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let g:dein#install_process_timeout = 600

if &runtimepath !~# '/dein.vim'
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand("~/.config/nvim/")
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
" ----- /dein.vim ------


" ----- colorscheme/ -----
set background=dark
colorscheme iceberg
" ----- /colorscheme -----
