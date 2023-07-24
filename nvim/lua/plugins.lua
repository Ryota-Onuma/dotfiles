vim.cmd [[packadd packer.nvim]]

require("packer").startup(function()
  use 'wbthomason/packer.nvim'
  use 'github/copilot.vim'
  use 'lewis6991/gitsigns.nvim'
  use  'folke/tokyonight.nvim'
  use {
    "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      requires = { 
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      },
      config = function()
        require("neo-tree").setup({
          popup_border_style = "rounded",
          source_selector = {
              winbar = false,
              statusline = false
          },
          filesystem = {
            filtered_items = {
              visible = true, -- when true, they will just be displayed differently than normal items
              hide_dotfiles = false,
              hide_gitignored = false,
            },
            follow_current_file = {
              enabled = true,
            },
            buffers = {
              follow_current_file = {
                enabled = true,
              },
            },
        }
      })
      end
  }
  use {
    'nvim-lualine/lualine.nvim',
     requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'easymotion/vim-easymotion'
end)
