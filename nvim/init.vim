syntax enable
set expandtab
set number

"Cライクな言語だったらいい感じにインデントする
set autoindent
set smartindent
set cindent

set shiftwidth=2
set softtabstop=4
set mouse=a
set encoding=utf-8
set cursorline
set fileencodings=utf-8,cp932
set clipboard+=unnamedplus
set modifiable
set write

"SpaceをLeaderにする
let mapleader = "\<Space>"

"ノーマルモード時
nnoremap <BS> "_<S-x>
nnoremap <C-c> :q!<CR>
nnoremap vv <C-v>
nnoremap <Leader>h ^
nnoremap <Leader>l $
nnoremap <Leader>. <cmd>CHADopen<CR>
nnoremap <S-t> :tabnew<CR>
nnoremap <S-w> :tabclose<CR>
nnoremap <S-tab> :tabnext<CR>


"削除キーでヤンクしない
nnoremap x "_x
nnoremap <S-x> "_<S-x>
nnoremap d "_d
nnoremap D "_D
nnoremap dd "_dd


"挿入モード時
inoremap <silent>jj <Esc>


"Visualモード時
vnoremap <Leader>q :q!<CR>
vnoremap <BS> "_<S-x>
vnoremap x "_x
vnoremap c y

"Terminalモード時
tnoremap <Esc> <C-\><C-n>
autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen * setlocal nonumber


call plug#begin()
    Plug 'rebelot/kanagawa.nvim' 
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
    Plug 'BurntSushi/ripgrep'
    Plug 'airblade/vim-rooter'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'github/copilot.vim'
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
    Plug 'folke/noice.nvim'
    Plug 'MunifTanjim/nui.nvim'
    Plug 'tpope/vim-commentary'
    Plug 'jiangmiao/auto-pairs'
call plug#end()

"nvim-cmpの設定
lua << EOF
local luasnip = require'luasnip'
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),
    ['<C-j>'] = cmp.mapping.scroll_docs(-4),
    ['<C-k>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-c>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'buffer' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
})
EOF

"gitsignsの設定
lua << EOF
require('gitsigns').setup {
  signs = {
    add          = { text = '+' },
    change       = { text = '|' },
    delete       = { text = '-' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = true, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
EOF

"noiceの設定
lua << EOF
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})
EOF

"Telescopeの設定
nnoremap <Leader>p <cmd>Telescope find_files<cr>
nnoremap <Leader>g <cmd>Telescope live_grep<cr>
inoremap <silent> <C-c> <cmd>Telescope close<cr>

lua << EOF
require('telescope').setup {
  defaults = {
    layout_config = {
      height = 0.9,
      width = 0.9,
    },
  },
}
EOF

"LSP周りの設定
lua << EOF
  local lspconfig = require('lspconfig')
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  lspconfig.gopls.setup{
      cmd = {"gopls"},
      filetypes = {'go', 'gomod', 'gowork', 'gotmpl'},
      root_dir = function(fname)
        return lspconfig.util.root_pattern("go.mod")(fname) or lspconfig.util.path.dirname(fname)
      end,
      capabilities = capabilities,
      settings = {
          gopls = {
              analyses = {
                  unusedparams = true,
              },
              staticcheck = true,
              gofumpt = true,
              completeUnimported = true,
              deepCompletion = true,
          },
      },
      on_attach = function(client)
          -- キーマッピングなどを設定する
      end,
  }
EOF

"保存時のフォーマット
autocmd BufWritePre *.go lua vim.lsp.buf.format(nil, 1500)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gb <C-o>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <silent> gt <cmd>lua vim.lsp.buf.type_definition()<cr>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<cr>

"テーマを設定する
set background=dark
colorscheme kanagawa-wave

highlight Visual ctermfg=black ctermbg=yellow gui=NONE guifg=black guibg=yellow

