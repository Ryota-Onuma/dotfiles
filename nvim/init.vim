set title

syntax on
set expandtab

" 行番号を表示
set number

" いい感じにインデントする
set autoindent
set smartindent
set cindent

set shiftwidth=2
set softtabstop=4
set mouse=a
set encoding=utf-8
set cursorline
set fileencodings=utf-8,cp932
set clipboard^=unnamed,unnamedplus
set modifiable
set write
set backspace=indent,eol,start

set display=lastline

set path+=$PWD/**

" 対応する括弧を表示
set showmatch matchtime=1

" 検索結果をハイライト
set hlsearch

" 色設定
colorscheme slate

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'github/copilot.vim'
    Plug 'tpope/vim-commentary'
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/vim-fern-hijack'
    Plug 'andykog/fern-highlight.vim'
    Plug 'lambdalisue/fern-git-status.vim'
    Plug 'lambdalisue/nerdfont.vim'
    Plug 'lambdalisue/fern-renderer-nerdfont.vim'
    Plug 'lambdalisue/glyph-palette.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#build_maple() } }
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
    Plug 'nvim-telescope/telescope-frecency.nvim'
call plug#end()

" .goファイルの保存時にフォーマットを行う
autocmd BufWritePre *.go :silent! :LspDocumentFormat

" LSPのキーマッピング
nnoremap <silent>gd :LspDefinition<CR>
nnoremap <silent>gr :LspReferences<CR>
nnoremap <silent>gi :LspImplementation<CR>
nnoremap <silent>gf :LspDocumentFormat<CR>
nnoremap <silent>gt :LspTypeDefinition<CR>
nnoremap <silent>K :LspHover<CR>
nnoremap <silent>gb <C-o>

" Fernの設定
nnoremap <C-n> :Fern . -drawer -reveal=% -toggle -width=50<CR>
" 隠しファイルを表示
let g:fern#default_hidden=1
let g:fern#renderer = 'nerdfont'
let hide_dirs  = '\v^(\.git|node_modules)$'
let hide_files = '\v\.swp$'
let g:fern#default_exclude = hide_dirs . '|' . hide_files

nnoremap <C-m> :Clap<CR>
let g:clap_theme = 'material_design_dark'

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
augroup END

nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-g> <cmd>Telescope live_grep<cr>
nnoremap <C-f> <cmd>Telescope frecency workspace=CWD<cr>
