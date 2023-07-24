vim.api.nvim_set_keymap('n', '<C-c>', ':q!<CR>',{})
vim.api.nvim_set_keymap('n', 'vv', '<C-v>',{})
vim.api.nvim_set_keymap('n', '<Leader>h', '^',{})
vim.api.nvim_set_keymap('n', '<Leader>l', '$',{})

vim.api.nvim_set_keymap('x', 'c', 'y',{})
vim.api.nvim_set_keymap('x', '<Leader>h', '^',{})
vim.api.nvim_set_keymap('x', '<Leader>l', '$',{})

-- easymotionの設定
vim.g.EasyMotion_do_mapping = 0
vim.g.EasyMotion_smartcase = 1
vim.api.nvim_set_keymap('n', 'f', '<Plug>(easymotion-s)', {silent = true})
vim.api.nvim_set_keymap('n', 'ff', '<Plug>(easymotion-overwin-f2)', {silent = true})
vim.api.nvim_set_keymap('x', 'f', '<Plug>(easymotion-s)', {silent = true})
vim.api.nvim_set_keymap('x', 'ff', '<Plug>(easymotion-overwin-f2)', {silent = true})

-- neotreeの設定
vim.api.nvim_set_keymap('n', '<C-n>', ':Neotree float reveal<CR>', {silent = true})

vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {})