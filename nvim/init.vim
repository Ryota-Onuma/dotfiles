"行番号を表示
set number
"タブ文字の代わりにスペースを使う
set expandtab
set smartindent
set shiftwidth=4
set softtabstop=4
set autochdir
set mouse=a
set encoding=utf-8
set cursorline
set fileencodings=utf-8,cp932

set clipboard&
set clipboard^=unnamedplus
"eコマンド等でTabキーを押すとパスを保管する : この場合まず最長一致文字列まで補完し、2回目以降は一つづつ試す
set wildmode=longest,full
" 対象が1件しかなくても常に補完ウィンドウを表示 補完ウィンドウを表示時に挿入しない
set completeopt=menuone,noinsert

let mapleader = "\<Space>"

" Space + Sで保存
nnoremap <Leader>s :w<CR>

" Space + lで行末
nnoremap <Leader>l $
vnoremap <Leader>l $

" Space + hで行頭
nnoremap <Leader>h ^
vnoremap <Leader>h ^

nnoremap <Leader>g :LazyGit<CR>
nnoremap :vsplit :split
nnoremap <BS> <S-x>
nnoremap <CR> o
nnoremap <Leader>q :q!<CR>

vnoremap <BS> d

" 補完表示時のEnterで改行をしない
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"

"削除キーでヤンクしない
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D

" 挿入モード時
inoremap jj <Esc>
set clipboard&
set clipboard^=unnamedplus

" RubyとJSではインデントを2マスにする
autocmd FileType ruby,javascript set shiftwidth=2 softtabstop=2

" VimのPluginをいれる
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

Plug 'tpope/vim-surround'
Plug 'cocopon/iceberg.vim'

Plug 'kdheepak/lazygit.nvim'

Plug 'preservim/nerdtree'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

let g:airline#extensions#tabline#enabled = 1
nmap <Leader>o <Plug>AirlineSelectPrevTab
nmap <Leader>p <Plug>AirlineSelectNextTab

let NERDTreeShowHidden = 1
nnoremap <C-n> :NERDTreeToggle $NVIM_APP_ROOT_DIR<CR>

nnoremap <C-p> <cmd>Telescope find_files cwd=$NVIM_APP_ROOT_DIR<cr>
nnoremap <C-g> <cmd>Telescope live_grep cwd=$NVIM_APP_ROOT_DIR theme=get_dropdown<cr>
nnoremap <C-b> <cmd>Telescope buffers theme=get_dropdown<cr>
nnoremap <C-b> <cmd>Telescope oldfiles theme=get_dropdown<cr>
nnoremap <C-f> <cmd>Telescope frecency<cr>

"" vim-airline
" ステータスラインに表示する項目を変更する
let g:airline#extensions#default#layout = [
  \ [ 'a', 'b', 'c' ],
  \ ['z']
  \ ]
let g:airline_section_c = '%t %M'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
" 変更がなければdiffの行数を表示しない
let g:airline#extensions#hunks#non_zero_only = 1 

" タブラインの表示を変更する
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_close_button = 0

nnoremap <Leader>gb <cmd>Telescope git_branches theme=get_dropdown<cr>

" ----- colorscheme/ -----
set background=dark
colorscheme iceberg
" ----- /colorscheme -----

