local autocmd = vim.api.nvim_create_autocmd

-- vim.highlight.on_yank()
autocmd("TextYankPost", {
   desc = "Highlight when yanking (copying) text",
   callback = function()
      vim.highlight.on_yank()
   end,
})
