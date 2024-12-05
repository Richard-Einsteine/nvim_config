return {
   "nvim-telescope/telescope.nvim",
   tag = "0.1.8",
   dependancies = {
      "nvim-lua/plenary.vim",
      "nvim-tree/nvim-web-devicons",
      {
         'nvim-telescope/telescope-fzf-native.nvim',
         build = "make",
      },
   },
   opts = {
      defaults = {
         file_ignore_patterns = {
            "target/",
         },
      },
   },
   config = function()
      require("telescope").setup()
      require("telescope").load_extension("fzf")
   end
}
