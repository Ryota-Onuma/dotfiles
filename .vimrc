set expandtab

set title

syntax on

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

" ステータス行を常に表示
set laststatus=2

" 対応する括弧を表示
set showmatch matchtime=1

" 検索結果をハイライト
set hlsearch

" 検索で大文字小文字を区別しない
set ignorecase


" コマンドラインの履歴を10000件保存する
set history=10000

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

nmap <Esc><Esc> :nohlsearch<CR>


" .vimrcを保存したら自動で読み込む
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END


"ツリー表示
filetype plugin on
"表示を変更したい場合は i で切替可能
let g:netrw_liststyle=3
"上部のバナーを非表示
let g:netrw_banner = 0
"window サイズ
let g:netrw_winsize = 25
"Netrw で Enter 押下時の挙動設定
let g:netrw_browse_split = 4
let g:netrw_alto = 1

" .gitと.swpは非表示にする
let g:netrw_list_hide='.*\.swp$\|\.git\($\|/\)'

" サイズの設定
let g:netrw_sizestyle="H"

" フォーマット設定
let g:netrw_timefmt="%Y-%m-%d(%a) %H:%M:%S"

"Netrw を toggle する関数を設定
"元処理と異なり Vex を呼び出すことで左 window に表示
function! ToggleNetrw()
    " netrwのウィンドウが開いているかどうかを確認する
    if exists("t:netrw_bufnr") && bufexists(t:netrw_bufnr)
        let l:bufnr = bufnr('%')

        " カレントのバッファがnetrwでない場合、netrwのバッファを閉じる
        if l:bufnr != t:netrw_bufnr
            execute 'buffer' l:bufnr
            execute 'bdelete' t:netrw_bufnr
        else
            " カレントのバッファがnetrwの場合、閉じる
            quit
        endif

        " 変数を削除する
        unlet t:netrw_bufnr
    else
        " netrwを左側のウィンドウとして開く
        Lexplore

        " netrwのバッファ番号を保存する
        let t:netrw_bufnr = bufnr('%')
    endif
endfunction

"ショートカットの設定
noremap <silent><C-n> :call ToggleNetrw()<CR>


"quickfixでEnterを押したら閉じるようにする
function! CloseQuickfixAndJump()
" Jump to the selected quickfix item
  execute "normal! \<CR>"

  " Close the quickfix window
  cclose
endfunction

"Map <Enter> in the quickfix window to the CloseQuickfixAndJump function
augroup quickfix_enter
  autocmd!
  autocmd FileType qf nnoremap <buffer> <CR> :call CloseQuickfixAndJump()<CR>
augroup END

" ---------------------------- キーバインディングの設定始まり ----------------------------------------

" マップリーダーをスペースに設定
let g:mapleader = " "


" ############# ノーマルモードの設定始まり ###############

" <C-c> で Vim を終了
nnoremap <C-c> :qa<CR>

" vv でビジュアルモードに入る
nnoremap vv <C-v>

" <Leader>h で行頭に移動
nnoremap <Leader>h ^

" <Leader>l で行末に移動
nnoremap <Leader>l $

"削除キーでヤンクしない
nnoremap x "_x
nnoremap <S-x> "_<S-x>
nnoremap d "_d
nnoremap D "_D
nnoremap dd "_dd

" ターミナルを開く
nnoremap tt :term<CR>

" 表示上の行移動と実際の行移動を入れ替える
nnoremap k   gk
nnoremap j   gj
nnoremap gk  k
nnoremap gj  j

" 単語検索
nnoremap <Leader>f  *<C-o>
nnoremap <expr> n <SID>search_forward_p() ? 'nzv' : 'Nzv'
nnoremap <expr> N <SID>search_forward_p() ? 'Nzv' : 'nzv'

" ファイル検索
nnoremap <Leader>p :if &filetype == 'netrw' \| wincmd p \| endif<CR>:find<Space>

" ############# ノーマルモードの設定終わり ###############



" ############# ビジュアルモードの設定始まり ###############

" c でコピー
xnoremap c y

" <Leader>h で選択範囲の行頭に移動
xnoremap <Leader>h ^

" <Leader>l で選択範囲の行末に移動
xnoremap <Leader>l $

" <BS> で選択範囲を削除してレジスタをクリア
xnoremap <BS> "_x

" <Leader>h で行頭に移動
vnoremap <Leader>h ^

" <Leader>l で行末に移動
vnoremap <Leader>l $

"削除キーでヤンクしない
vnoremap <BS> "_x
vnoremap x "_x
vnoremap c y

" 表示上の行移動と実際の行移動を入れ替える
vnoremap k   gk
vnoremap j   gj
vnoremap gk  k
vnoremap gj  j

" 単語検索
vnoremap <Leader>f  *<C-o>
vnoremap <expr> n <SID>search_forward_p() ? 'nzv' : 'Nzv'
vnoremap <expr> N <SID>search_forward_p() ? 'Nzv' : 'nzv'


" ############# ビジュアルモードの設定終わり ###############

function! s:search_forward_p()
  return exists('v:searchforward') ? v:searchforward : 1
endfunction

" ############# インサートモードの設定始まり ###############

" jj で 抜ける
inoremap jj <Esc>

" ############# インサートモードの設定終わり ###############




" ############# ターミナルモードの設定始まり ###############

tnoremap <Esc> :<C-u><C-\><C-n>:q!<CR>
tnoremap <C-c> :<C-u><C-\><C-n>:q!<CR>

set splitbelow
set termwinsize=30x0


" ############# ターミナルモードの設定終わり ###############


" ---------------------------- キーバインディングの設定終わり ----------------------------------------

" 色設定
colorscheme slate

" visual modeで選択した部分の色を変える
highlight visual ctermfg=black ctermbg=yellow gui=none guifg=black guibg=yellow

hi Comment ctermfg=3


call plug#begin()
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'Shougo/ddc.vim'
    Plug 'shun/ddc-vim-lsp'
    Plug 'github/copilot.vim'
    Plug 'tpope/vim-commentary'
call plug#end()

setlocal signcolumn=no

" .goだったらフォーマットをかける
autocmd BufWritePre *.go :silent! :LspDocumentFormat

nnoremap <silent>gd :LspDefinition<CR>
nnoremap <silent>gr :LspReferences<CR>
nnoremap <silent>gi :LspImplementation<CR>
nnoremap <silent>gf :LspDocumentFormat<CR>
nnoremap <silent>gt :LspTypeDefinition<CR>
nnoremap <silent>K :LspHover<CR>
nnoremap <silent>gb <C-o>

