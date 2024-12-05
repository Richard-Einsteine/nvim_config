local servers = {
   "lua_ls",
   "rust_analyzer",
   "clangd",
   "emmet_language_server",
   "pyright",
   "zls",
   "vimls",
   "elixirls"
}

return {
   "neovim/nvim-lspconfig",
   dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
   },
   config = function()
      local lspconf = require("plugins.utils.lspconfig")
      local lspconfig = require "lspconfig"
      require("mason").setup()
      require("mason-lspconfig").setup { ensure_installed = servers }

      -- lsps with default config
      for _, lsp in ipairs(servers) do
         lspconfig[lsp].setup {
            on_attach = lspconf.on_attach,
            on_init = lspconf.on_init,
            capabilities = lspconf.capabilities,
         }
      end

      -- configuring single server, example: typescript
      lspconfig.lua_ls.setup {
         on_attach = lspconf.on_attach,
         capabilities = lspconf.capabilities,
         on_init = lspconf.on_init,

         settings = {
            Lua = {
               diagnostics = {
                  globals = { "vim" },
               },
            },
         },
      }
   end
}
