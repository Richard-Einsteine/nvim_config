return {
   "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   opts = {
      ensure_installed = {
         "c",
         "cpp",
         "lua",
         "luadoc",
         "vim",
         "vimdoc",
         "tex",
         "javascript",
         "html",
         "fish",
         "css",
         "markdown",
         "rust",
         "python",
         "elixir",
         "eex",
         "heex"
      },
      sync_install = false,
      auto_install = true,
      highlight = {
         enable = true,
         disable = { "latex", },
      },
      indent = { enable = true },
   },
   config = function()
      -- local configs = require("nvim-treesitter.configs")
   end
}
