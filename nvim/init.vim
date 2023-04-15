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
    Plug 'pwntester/octo.nvim'
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
         follow_current_file = true,
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
nnoremap <Leader>pp <cmd>Telescope frecency<cr>
nnoremap <Leader>i <cmd>Telescope media_files<cr>
inoremap <silent> <C-c> <cmd>Telescope close<cr>

lua << EOF
  require('telescope').setup {
    defaults = {
      layout_config = {
        height = 0.9,
        width = 0.9,
      },
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
      end,
  }
EOF

lua << EOF
require"octo".setup({
  default_remote = {"upstream", "origin"}; -- order to try remotes
  ssh_aliases = {},                        -- SSH aliases. e.g. `ssh_aliases = {["github.com-work"] = "github.com"}`
  reaction_viewer_hint_icon = "";         -- marker for user reactions
  user_icon = " ";                        -- user icon
  timeline_marker = "";                   -- timeline marker
  timeline_indent = "2";                   -- timeline indentation
  right_bubble_delimiter = "";            -- bubble delimiter
  left_bubble_delimiter = "";             -- bubble delimiter
  github_hostname = "";                    -- GitHub Enterprise host
  snippet_context_lines = 4;               -- number or lines around commented lines
  gh_env = {},                             -- extra environment variables to pass on to GitHub CLI, can be a table or function returning a table
  timeout = 5000,                          -- timeout for requests between the remote server
  ui = {
    use_signcolumn = true,                 -- show "modified" marks on the sign column
  },
  issues = {
    order_by = {                           -- criteria to sort results of `Octo issue list`
      field = "CREATED_AT",                -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
      direction = "DESC"                   -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
    }
  },
  pull_requests = {
    order_by = {                           -- criteria to sort the results of `Octo pr list`
      field = "CREATED_AT",                -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
      direction = "DESC"                   -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
    },
    always_select_remote_on_create = "false" -- always give prompt to select base remote repo when creating PRs
  },
  file_panel = {
    size = 10,                             -- changed files panel rows
    use_icons = true                       -- use web-devicons in file panel (if false, nvim-web-devicons does not need to be installed)
  },
  mappings = {
    pull_request = {
      checkout_pr = { lhs = "ghpo", desc = "checkout PR" },
      merge_pr = { lhs = "ghpm", desc = "merge commit PR" },
      squash_and_merge_pr = { lhs = "ghpsm", desc = "squash and merge PR" },
      list_commits = { lhs = "ghpc", desc = "list PR commits" },
      list_changed_files = { lhs = "ghpf", desc = "list PR changed files" },
      show_pr_diff = { lhs = "ghpd", desc = "show PR diff" },
      add_reviewer = { lhs = "ghva", desc = "add reviewer" },
      remove_reviewer = { lhs = "ghvd", desc = "remove reviewer request" },
      close_issue = { lhs = "ghic", desc = "close PR" },
      reopen_issue = { lhs = "ghio", desc = "reopen PR" },
      list_issues = { lhs = "ghil", desc = "list open issues on same repo" },
      reload = { lhs = "<C-r>", desc = "reload PR" },
      open_in_browser = { lhs = "<C-b>", desc = "open PR in browser" },
      copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
      goto_file = { lhs = "gf", desc = "go to file" },
      add_assignee = { lhs = "ghaa", desc = "add assignee" },
      remove_assignee = { lhs = "ghad", desc = "remove assignee" },
      create_label = { lhs = "ghlc", desc = "create label" },
      add_label = { lhs = "ghla", desc = "add label" },
      remove_label = { lhs = "ghld", desc = "remove label" },
      goto_issue = { lhs = "ghgi", desc = "navigate to a local repo issue" },
      add_comment = { lhs = "ghca", desc = "add comment" },
      delete_comment = { lhs = "ghcd", desc = "delete comment" },
      next_comment = { lhs = "]c", desc = "go to next comment" },
      prev_comment = { lhs = "[c", desc = "go to previous comment" },
      react_hooray = { lhs = "ghrp", desc = "add/remove 🎉 reaction" },
      react_heart = { lhs = "ghrh", desc = "add/remove ❤️ reaction" },
      react_eyes = { lhs = "ghre", desc = "add/remove 👀 reaction" },
      react_thumbs_up = { lhs = "ghr+", desc = "add/remove 👍 reaction" },
      react_thumbs_down = { lhs = "ghr-", desc = "add/remove 👎 reaction" },
      react_rocket = { lhs = "ghrr", desc = "add/remove 🚀 reaction" },
      react_laugh = { lhs = "ghrl", desc = "add/remove 😄 reaction" },
      react_confused = { lhs = "ghrc", desc = "add/remove 😕 reaction" },
    },
    review_thread = {
      goto_issue = { lhs = "ghgi", desc = "navigate to a local repo issue" },
      add_comment = { lhs = "ghca", desc = "add comment" },
      add_suggestion = { lhs = "ghsa", desc = "add suggestion" },
      delete_comment = { lhs = "ghcd", desc = "delete comment" },
      next_comment = { lhs = "]c", desc = "go to next comment" },
      prev_comment = { lhs = "[c", desc = "go to previous comment" },
      select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
      select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
      close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
      react_hooray = { lhs = "ghrp", desc = "add/remove 🎉 reaction" },
      react_heart = { lhs = "ghrh", desc = "add/remove ❤️ reaction" },
      react_eyes = { lhs = "ghre", desc = "add/remove 👀 reaction" },
      react_thumbs_up = { lhs = "ghr+", desc = "add/remove 👍 reaction" },
      react_thumbs_down = { lhs = "ghr-", desc = "add/remove 👎 reaction" },
      react_rocket = { lhs = "ghrr", desc = "add/remove 🚀 reaction" },
      react_laugh = { lhs = "ghrl", desc = "add/remove 😄 reaction" },
      react_confused = { lhs = "ghrc", desc = "add/remove 😕 reaction" },
    },
    submit_win = {
      approve_review = { lhs = "<C-a>", desc = "approve review" },
      comment_review = { lhs = "<C-m>", desc = "comment review" },
      request_changes = { lhs = "<C-r>", desc = "request changes review" },
      close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
    },
    review_diff = {
      add_review_comment = { lhs = "ghca", desc = "add a new review comment" },
      add_review_suggestion = { lhs = "ghsa", desc = "add a new review suggestion" },
      focus_files = { lhs = "<leader>e", desc = "move focus to changed file panel" },
      toggle_files = { lhs = "<leader>b", desc = "hide/show changed files panel" },
      next_thread = { lhs = "]t", desc = "move to next thread" },
      prev_thread = { lhs = "[t", desc = "move to previous thread" },
      select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
      select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
      close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
      toggle_viewed = { lhs = "<leader>gh", desc = "toggle viewer viewed state" },
    },
    file_panel = {
      next_entry = { lhs = "j", desc = "move to next changed file" },
      prev_entry = { lhs = "k", desc = "move to previous changed file" },
      select_entry = { lhs = "<cr>", desc = "show selected changed file diffs" },
      refresh_files = { lhs = "R", desc = "refresh changed files panel" },
      focus_files = { lhs = "<leader>e", desc = "move focus to changed file panel" },
      toggle_files = { lhs = "<leader>b", desc = "hide/show changed files panel" },
      select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
      select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
      close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
      toggle_viewed = { lhs = "<leader><space>", desc = "toggle viewer viewed state" },
    }
  }
})
EOF

"保存時のフォーマット
autocmd BufWritePre *.go lua vim.lsp.buf.format(nil, 1500)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent> gb <C-o>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <silent> gt <cmd>lua vim.lsp.buf.type_definition()<cr>
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


