return {

   "szw/vim-maximizer", -- maximises and restores current window

   {
      "nvim-tree/nvim-tree.lua", --file explorer
      version = '*',
      lazy = false,
      dependacies = {
         "nvim-tree/nvim-web-devicons",
      },
      config = function()
         vim.g.loaded = 1
         vim.g.loaded_netrwPluging = 1
         require("nvim-tree").setup {}
      end,
   },

   {
      'ribru17/bamboo.nvim',
      lazy = false,
      opts = {
         style = "vulgaris",
      },
      config = function()
         require('bamboo').load()
      end,
   },
   {
      "stevearc/conform.nvim",
      lazy = false,
   },
   {
      "lewis6991/gitsigns.nvim", -- Adds git related signs to the gutter
      opts = {
         signs = {
            add = { text = "│" },
            change = { text = "│" },
            delete = { text = "󰍵" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
            untracked = { text = "│" },
         },
      },
   },
   {
      "nvim-lualine/lualine.nvim", -- status bar
      dependancies = {
         "nvim-tree/nvim-web-devicons",
      },
      opts = {
         theme = "auto",
      },
   },
   {
      "lervag/vimtex",
      lazy = false,
      init = function()
         vim.g.vimtex_view_method = "zathura"
         -- vim.g.vimtex_imaps_enabled = 0   -- Disable insert mode mappings
      end
   },
   {
      "folke/todo-comments.nvim", -- takes TODO/README/FIX/... comments in context
      event = 'VimEnter',
      dependencies = { 'nvim-lua/plenary.nvim' },
      opts = { signs = false }
   },
   {
      "lukas-reineke/indent-blankline.nvim", -- hightlights indents with a "|"
      main = "ibl",
      opts = {},
   },

   "nvim-tree/nvim-web-devicons",

   {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = "make",
   },

   {
      'stevearc/oil.nvim',
      opts = {},
      dependencies = { "nvim-tree/nvim-web-devicons" },
   },
}
