vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<C-c>", ":q!<CR>", {})
vim.api.nvim_set_keymap("n", "vv", "<C-v>", {})
vim.api.nvim_set_keymap("n", "<Leader>h", "^", {})
vim.api.nvim_set_keymap("n", "<Leader>l", "$", {})
vim.api.nvim_set_keymap("x", "c", "y", {})
vim.api.nvim_set_keymap("x", "<Leader>h", "^", {})
vim.api.nvim_set_keymap("x", "<Leader>l", "$", {})
vim.api.nvim_set_keymap("x", "<BS>", '"_x', {})
vim.api.nvim_set_keymap("i", "jj", "<Esc>", {})

-- fzf-luaの設定
vim.api.nvim_set_keymap("n", "<Leader>p", ':lua require("fzf-lua").files()<CR>', { silent = true })
vim.api.nvim_set_keymap("n", "<Leader>pp", ':lua require("fzf-lua").oldfiles()<CR>', { silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<Leader>g",
	':lua require("fzf-lua").live_grep({ prompt="Found files> "})<CR>',
	{ silent = true }
)

-- lspの設定
vim.api.nvim_set_keymap("n", "gd", ':lua require("fzf-lua").lsp_definitions()<CR>', { silent = true })
vim.api.nvim_set_keymap("n", "gb", "<C-o>", { silent = true })
vim.api.nvim_set_keymap("n", "gr", ':lua require("fzf-lua").lsp_references()<CR>', { silent = true })
vim.api.nvim_set_keymap("n", "gi", ':lua require("fzf-lua").lsp_implementations()<CR>', { silent = true })
vim.api.nvim_set_keymap("n", "gt", ':lua require("fzf-lua").lsp_typedefs()<CR>', { silent = true })
vim.api.nvim_set_keymap("n", "gf", ":lua vim.lsp.buf.format()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gk", ":lua vim.diagnostic.open_float()<CR>", { silent = true })

-- easymotionの設定
vim.g.EasyMotion_do_mapping = 0
vim.g.EasyMotion_smartcase = 1
vim.api.nvim_set_keymap("n", "f", "<Plug>(easymotion-s)", { silent = true })
vim.api.nvim_set_keymap("n", "ff", "<Plug>(easymotion-overwin-f2)", { silent = true })
vim.api.nvim_set_keymap("x", "f", "<Plug>(easymotion-s)", { silent = true })
vim.api.nvim_set_keymap("x", "ff", "<Plug>(easymotion-overwin-f2)", { silent = true })

-- neotreeの設定
vim.api.nvim_set_keymap("n", "<C-n>", ":Neotree float reveal<CR>", { silent = true })
