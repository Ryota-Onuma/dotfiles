vim.cmd('syntax enable')
vim.cmd('set expandtab')
vim.cmd('set number')
vim.cmd('set autoindent')
vim.cmd('set smartindent')
vim.cmd('set cindent')
vim.cmd('set shiftwidth=2')
vim.cmd('set softtabstop=4')
vim.cmd('set mouse=a')
vim.cmd('set encoding=utf-8')
vim.cmd('set cursorline')
vim.cmd('set fileencodings=utf-8,cp932')
vim.cmd('set clipboard+=unnamedplus')
vim.cmd('set modifiable')
vim.cmd('set write')
vim.cmd('set shortmess+=F')
vim.cmd('set laststatus=0')

vim.cmd.colorscheme "tokyonight-night"
vim.cmd("highlight visual ctermfg=black ctermbg=red gui=none guifg=black guibg=red")
require('lualine').setup {
    options = {
      theme = 'tokyonight'
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding','filetype'},
        lualine_y = {'progress'},
        lualine_z = {'selectioncount'}
    },
}


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
    }
}

require'fzf-lua'.setup({
  files               = {
    prompt       = 'Files: ',
    multiprocess = true, 
    git_icons    = true, 
    file_icons   = true, 
    color_icons  = true, 
    find_opts    = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
    rg_opts      = "--color=never --files --hidden --follow -g '!.git'",
    fd_opts      = "--color=never --type f --hidden --follow --exclude .git",
},
  oldfiles            = {
    prompt                  = 'History: ',
    cwd_only                = true,
    stat_file               = true, -- verify files exist on disk
    include_current_session = true, -- include bufs from current session
},
})

vim.cmd [[
highlight FzfLuaNormal guibg=#1a1b26
highlight FzfLuaBorder guibg=#1a1b26
]]

require'alpha'.setup(require'alpha.themes.dashboard'.config)