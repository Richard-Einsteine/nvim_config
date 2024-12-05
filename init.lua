-- Check for lazy, install if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
   local lazyrepo = "https://github.com/folke/lazy.nvim.git"
   vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
-- add lazy to path
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- Setup lazy.nvim
-- require("lazy").setup( "plugins" )
require("lazy").setup({
   spec = {
      { import = "plugins" },
   },
   install = {
      colorscheme = { "bamboo" }
   },
   performance = {
      rtp = {
         -- disable some rtp plugins
         disabled_plugins = {
            "gzip",
            -- "matchit",
            -- "matchparen",
            "netrwPlugin",
            "tarPlugin",
            "tohtml",
            "tutor",
            "zipPlugin",
         },
      },
   },
})

require("core.options")
require("core.keymaps")
require("core.autocommands")
