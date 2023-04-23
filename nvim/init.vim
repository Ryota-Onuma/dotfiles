
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
set scrolloff=3

call plug#begin()
    Plug 'rebelot/kanagawa.nvim' 
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'nvim-lua/plenary.nvim'
    " telescope周り
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
    Plug 'nvim-lua/popup.nvim'

    Plug 'nvim-tree/nvim-web-devicons'
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
    Plug 'nvim-neo-tree/neo-tree.nvim'
    Plug 'folke/noice.nvim'
    Plug 'MunifTanjim/nui.nvim'
    Plug 'tpope/vim-commentary'
    Plug 'jiangmiao/auto-pairs'
    Plug 'easymotion/vim-easymotion'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'folke/todo-comments.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'goolord/alpha-nvim'
    Plug 'segeljakt/vim-silicon', { 'on': 'Silicon'}
    Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
    Plug 'jsborjesson/vim-uppercase-sql'
    Plug 'hashivim/vim-terraform'
    Plug 'epwalsh/obsidian.nvim'
    Plug 'mattn/vim-goimports'
    Plug 'yuttie/comfortable-motion.vim'
    Plug 'Shatur/neovim-session-manager'
call plug#end()

"テーマを設定する
set background=dark
colorscheme kanagawa-wave

highlight visual ctermfg=black ctermbg=yellow gui=none guifg=black guibg=yellow


"SpaceをLeaderにする
let mapleader = "\<Space>"

"ノーマルモード時
nnoremap <BS> "_<S-x>
nnoremap <silent><C-c> :q!<CR>
nnoremap <Leader>h ^
nnoremap <Leader>l $
nnoremap <S-t> :tabnew<CR>
nnoremap <S-w> :tabclose<CR>
nnoremap <S-tab> :tabnext<CR>
"pathと打ったらクリップボードにパスをコピーする
nnoremap <silent> path :let @*=expand('%')<CR>
nnoremap <silent> <C-n> :Neotree float reveal toggle filesystem<CR>
nnoremap <C-,> :ToggleTerm size=80 direction=float<CR><Esc>i
nnoremap vv <C-v> 

"easymotionの設定
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1  " Turn on case insensitive feature
noremap <Leader>j <Plug>(easymotion-j)
noremap <Leader>k <Plug>(easymotion-k)
noremap <Leader>w <Plug>(easymotion-jumptoanywhere)
noremap of <Plug>(easymotion-overwin-f2)
noremap f <Plug>(easymotion-bd-f)

"削除キーでヤンクしない
nnoremap x "_x
nnoremap <S-x> "_<S-x>
nnoremap d "_d
nnoremap D "_D
nnoremap dd "_dd


"挿入モード時
inoremap <silent>jj <Esc>


"Visualモード時
vnoremap <BS> "_x
vnoremap x "_x
vnoremap c y
vnoremap af <Plug>(nvim-treesitter-textobjects-select-a-function)
vnoremap if <Plug>(nvim-treesitter-textobjects-select-inner-function)
vnoremap ab <Plug>(nvim-treesitter-textobjects-select-a-block) 
vnoremap ib <Plug>(nvim-treesitter-textobjects-select-inner-block)
vnoremap al <Plug>(nvim-treesitter-textobjects-select-a-loop)
vnoremap il <Plug>(nvim-treesitter-textobjects-select-inner-loop)
vnoremap ac <Plug>(nvim-treesitter-textobjects-select-a-condition)
vnoremap ic <Plug>(nvim-treesitter-textobjects-select-inner-condition)
vnoremap s :'<,'>Silicon ~/desktop/images/screenshots/code-{time:%Y-%m-%d-%H%M%S}.png<CR>
vnoremap f <Plug>(easymotion-bd-f)

"Terminalモード時
tnoremap <Esc> <C-\><C-n><CR>
tnoremap <C-c> <C-\><C-n><CR>
tnoremap <C-,> <C-\><C-n>:close<CR>
autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen * setlocal nonumber

lua  require("toggleterm").setup()

"ファイラの設定
lua << EOF
require("neo-tree").setup({
  popup_border_style = "rounded",
  source_selector = {
      winbar = false,
      statusline = false
  },
  filesystem = {
     filtered_items = {
        visible = true, 
        hide_dotfiles = false,
        hide_gitignored = true,
     }
  },
  buffers = {
        follow_current_file = true,
  },
})
EOF

lua require'alpha'.setup(require'alpha.themes.dashboard'.config)

" noiceの設定
lua << EOF
require("noice").setup({
  cmdline = {
    enabled = true, 
    view = "cmdline_popup", 
    opts = {},
    format = {
      cmdline = { pattern = "^:", icon = "", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = "", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = "", lang = "regex" },
      filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
      lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
      help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
      input = {}, 
    },
  },
  messages = {
    enabled = true, 
    view = "notify", -- default view for messages
    view_error = "notify", -- view for errors
    view_warn = "notify", -- view for warnings
    view_history = "messages", -- view for :messages
    view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
  },
  popupmenu = {
    enabled = true,
    backend = "nui", 
    kind_icons = {}, 
  },
  commands = {
    history = {
      -- options for the message history that you get with `:Noice`
      view = "split",
      opts = { enter = true, format = "details" },
      filter = {
        any = {
          { event = "notify" },
          { error = true },
          { warning = true },
          { event = "msg_show", kind = { "" } },
          { event = "lsp", kind = "message" },
        },
      },
    },
    -- :Noice last
    last = {
      view = "popup",
      opts = { enter = true, format = "details" },
      filter = {
        any = {
          { event = "notify" },
          { error = true },
          { warning = true },
          { event = "msg_show", kind = { "" } },
          { event = "lsp", kind = "message" },
        },
      },
      filter_opts = { count = 1 },
    },
    -- :Noice errors
    errors = {
      -- options for the message history that you get with `:Noice`
      view = "popup",
      opts = { enter = true, format = "details" },
      filter = { error = true },
      filter_opts = { reverse = true },
    },
  },
  notify = {
    enabled = true,
    view = "notify",
  },
  lsp = {
    progress = {
      enabled = true,
      format = "lsp_progress",
      format_done = "lsp_progress_done",
      throttle = 1000 / 30,
      view = "mini",
   },
   override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = false, 
    command_palette = true, 
    long_message_to_split = true,
    inc_rename = false, 
    lsp_doc_border = false, 
  },
})
EOF

"アノテーションコメントを目立たせる
lua << EOF
  require("todo-comments").setup({
    signs = true, 
    sign_priority = 8,
    keywords = {
      FIX = {
        icon = " ", 
        color = "error", 
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, 
      },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "info", alt = { "INFO" } },
      TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    gui_style = {
      fg = "NONE", -- The gui style to use for the fg highlight group.
      bg = "BOLD", -- The gui style to use for the bg highlight group.
    },
    highlight = {
      multiline = true, -- enable multine todo comments
      multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
      multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
      before = "", -- "fg" or "bg" or empty
      keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
      after = "fg", -- "fg" or "bg" or empty
      pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
      comments_only = true, -- uses treesitter to match keywords in comments only
      max_line_len = 400, -- ignore lines longer than this
      exclude = {}, -- list of file types to exclude highlighting
    },
 })
EOF

lua << EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "css",
      "dockerfile",
      "go",
      "gomod",
      "gosum",
      "gowork",
      "graphql",
      "html",
      "java",
      "javascript",
      "json",
      "lua",
      "python",
      "regex",
      "rust",
      "toml",
      "tsx",
      "typescript",
      "yaml",
      "vue",
      "ruby",
      "gitignore",
      "vim",
      "terraform",
      "scss"
    }, 

    sync_install = false,

    auto_install = true,

    ignore_install = {},

    highlight = {
      enable = true, -- ハイライトを有効にする
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["ac"] = "@conditional.outer",
          ["ic"] = "@conditional.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner"
       }
      },
      swap = {
        enable = false,
      },
      move = {
        enable = false,
      },
    },
  }
EOF

"lualineの設定
lua << EOF
  require('lualine').setup({
    options = {
      theme = 'onedark'
    }
  })
EOF


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
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-n>'] = cmp.mapping.scroll_docs(4),
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

"jsonを自動で整形する
function! RunJqOnJsonSave()
  if expand('%:e') ==# 'json'
    silent !clear
    silent execute ':%!jq . ' . shellescape(expand('%'))
  endif
endfunction

autocmd BufWritePost * call RunJqOnJsonSave()

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

"Telescopeの設定
nnoremap <Leader>p <cmd>Telescope find_files hidden=true<cr>
nnoremap <Leader>g <cmd>Telescope live_grep<cr>
"recent_filesを<Leader>ppに割り当てる
nnoremap <Leader>pp <cmd>Telescope oldfiles cwd_only=true<cr>
" nnoremap <Leader>b <cmd>Telescope buffers<cr>
nnoremap <Leader>b <cmd>Telescope<cr>
inoremap <silent><C-c> <cmd>Telescope close<cr>

lua << EOF
   require('telescope').setup {
    defaults = {
      layout_config = {
        height = 0.9,
        width = 0.9,
      },
      file_ignore_patterns = {".git/*","node_modules/","graphql.schema.json","**/yarn.lock","gql.ts","schemaspy/*"}
    },
    extensions = {}
  }
EOF

lua << EOF
  local Path = require('plenary.path')
  require('session_manager').setup({
    sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
    path_replacer = '__', -- The character to which the path separator will be replaced for session files.
    colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
    autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
    autosave_last_session = true, -- Automatically save last session on exit and on session switch.
    autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
    autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
    autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
      'gitcommit',
    },
    autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
    autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
    max_path_length = 80,  -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
  })
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
        -- TODO:　Go以外の言語でもいい感じにする 
        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format()')
      end,
  }

    lspconfig.tsserver.setup{}

EOF

"保存時のフォーマット
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gb <C-o>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <silent> gt <cmd>lua vim.lsp.buf.type_definition()<cr>
nnoremap <silent> gf <cmd>lua vim.lsp.buf.format()<cr>
nnoremap <silent> ga <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<cr>

let g:terraform_fmt_on_save=1
let g:goimports = 1

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


