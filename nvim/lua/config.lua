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
