"行番号を表示
set number
"タブ文字の代わりにスペースを使う
set expandtab
set smartindent
set shiftwidth=4
set softtabstop=4
set autochdir
set encoding=utf-8
set cursorline
set fileencoding=utf-8
set fileencodings=utf-8,cp932

set clipboard&
set clipboard^=unnamedplus
"eコマンド等でTabキーを押すとパスを保管する : この場合まず最長一致文字列まで補完し、2回目以降は一つづつ試す
set wildmode=longest,full

"mac command + p でfzf起動
nmap <C-p> :Files $APP_ROOT_DIR<CR>

" 挿入モード時
inoremap jj <Esc>
set clipboard&
set clipboard^=unnamedplus


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


let g:seiya_auto_enable=1
" ----- colorscheme/ -----
set background=dark
colorscheme iceberg
" ----- /colorscheme -----
