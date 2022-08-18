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
set fileencoding=utf-8
set fileencodings=utf-8,cp932

set clipboard&
set clipboard^=unnamedplus
"eコマンド等でTabキーを押すとパスを保管する : この場合まず最長一致文字列まで補完し、2回目以降は一つづつ試す
set wildmode=longest,full

let mapleader = "\<Space>"

" Space + Sで保存
nnoremap <Leader>s :w<CR>

" Space + lで行末
nnoremap <Leader>l $
vnoremap <Leader>l $

" Space + hで行頭
nnoremap <Leader>h ^
vnoremap <Leader>h ^

nnoremap <BS> <S-x>

nnoremap <C-p> <cmd>Telescope find_files cwd=$APP_ROOT_DIR hidden=true theme=get_dropdown<cr>
nnoremap <C-g> <cmd>Telescope live_grep theme=get_dropdown<cr>
nnoremap <C-b> <cmd>Telescope buffers theme=get_dropdown<cr>
nnoremap <C-b> <cmd>Telescope oldfiles theme=get_dropdown<cr>
nnoremap <C-f> <cmd>Telescope frecency<cr>

nnoremap <leader>gb <cmd>Telescope git_branches theme=get_dropdown<cr>

"削除キーでヤンクしない
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D

" 挿入モード時
inoremap jj <Esc>
set clipboard&
set clipboard^=unnamedplus
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


"RubyとJSではインデントを2マスにする
autocmd FileType ruby,javascript set shiftwidth=2 softtabstop=2

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

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1


let g:seiya_auto_enable=1
" ----- colorscheme/ -----
set background=dark
colorscheme iceberg
" ----- /colorscheme -----
