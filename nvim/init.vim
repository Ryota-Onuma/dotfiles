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

call plug#begin()
    Plug 'rebelot/kanagawa.nvim' 
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'nvim-lua/plenary.nvim'

    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
    Plug 'nvim-telescope/telescope-frecency.nvim'
    Plug 'kkharji/sqlite.lua'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope-media-files.nvim'

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
    Plug 'nvim-lua/plenary.nvim'
    Plug 'folke/todo-comments.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'goolord/alpha-nvim'
    Plug 'segeljakt/vim-silicon'
    Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
    Plug 'jsborjesson/vim-uppercase-sql'
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
nnoremap <silent> path :let @*=expand('%')<CR>
nnoremap <C-n> :Neotree float reveal<CR>
nnoremap <C-,> :ToggleTerm size=80 direction=float<CR><Esc>i
nnoremap vv <C-v> 

"easymotionの設定
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1  " Turn on case insensitive feature
noremap <Leader>j <Plug>(easymotion-j)
noremap <Leader>k <Plug>(easymotion-k)
noremap <Leader>w <Plug>(easymotion-jumptoanywhere)
noremap f <Plug>(easymotion-overwin-f2)


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

"noiceの設定
lua << EOF
require("noice").setup({
  cmdline = {
    enabled = true, -- enables the Noice cmdline UI
    view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    opts = {}, -- global options for the cmdline. See section on views
    ---@type table<string, CmdlineFormat>
    format = {
      -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
      -- view: (default is cmdline view)
      -- opts: any options passed to the view
      -- icon_hl_group: optional hl_group for the icon
      -- title: set to anything or empty string to hide
      cmdline = { pattern = "^:", icon = "", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = "", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = "", lang = "regex" },
      filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
      lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
      help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
      input = {}, -- Used by input()
      -- lua = false, -- to disable a format, set to `false`
    },
  },
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
nnoremap <Leader>pp <cmd>Telescope frecency<cr>
nnoremap <Leader>ii <cmd>Telescope media_files<cr>
inoremap <silent><C-c> <cmd>Telescope close<cr>

lua << EOF
  require('telescope').setup {
    defaults = {
      layout_config = {
        height = 0.9,
        width = 0.9,
      },
      file_ignore_patterns = {"*/node_modules","graphql.schema.json","yarn.lock","*/gql.ts"}
    },
   extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      -- find command (defaults to `fd`)
      find_cmd = "rg"
    }
  },

  }
  require('telescope').load_extension('frecency')
  require('telescope').load_extension('media_files')
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
        -- BufWritePreイベントでLspCodeActionSyncとLspDocumentFormatSyncを実行する
        vim.cmd('autocmd BufWritePre <buffer> lua OrganizeImportsAndFormat()')
      end,
  }

     function OrganizeImportsAndFormat()
          local params = {
              context = {
                  diagnostics = {}
              },
              only = {"source.organizeImports"}
          }

          local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)

          for _, actions in ipairs(result) do
              for _, action in ipairs(actions.result or {}) do
                  if action.kind == "source.organizeImports" then
                      vim.lsp.buf.execute_command(action)
                      break
                  end
              end
          end
          vim.lsp.buf.format()
    end
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


