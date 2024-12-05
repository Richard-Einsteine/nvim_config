local cmp = require "cmp"
local luasnip = require "luasnip"

local options = {
   completion = { completeopt = "menu,menuone,noselect,noinsert" },

   snippet = {
      expand = function(args)
         require("luasnip").lsp_expand(args.body)
      end,
   },

   sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer",  keyword_length = 4 },
      { name = "nvim_lua" },
      { name = "path" },
   },

   formatting = {
      fields = {"kind","abbr", "menu"},
      format = function(entry, vim_item)
         vim_item.menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            path = "[Path]",
         })[entry.source.name]
         return vim_item
      end
   },

   mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),

      ["<CR>"] = cmp.mapping(function(fallback)
         if cmp.visible() and cmp.get_active_entry() then
            if luasnip.expandable() then
               luasnip.expand()
            else
               cmp.confirm({
                  select = true,
               })
            end
            -- if nothing is selected, <CR> does nothing(Just makes a new line)
         else
            fallback()
         end
      end),

      ["<Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            if #cmp.get_entries() == 1 then
               cmp.confirm({ select = true })
            else
               cmp.select_next_item()
            end
         elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
         else
            fallback()
         end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_prev_item()
         elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
         else
            fallback()
         end
      end, { "i", "s" }),
   },

}
return options
