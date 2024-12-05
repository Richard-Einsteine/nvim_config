local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values

local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local themes = vim.fn.getcompletion("", "color")
local theme_options = {
   winblend = 10,
   layout_config = {
      width = 0.3
   }
}

local function open(opts)
   opts = opts or require("telescope.themes").get_dropdown(theme_options)
   pickers.new(opts, {
      prompt_title = "colorschemes",
      finder = finders.new_table {
         results = themes,

      },
      sorter = conf.generic_sorter(opts),

      attach_mappings = function(prompt_bufnr, _)
         actions.select_default:replace(function()
            local selection = action_state.get_selected_entry()
            vim.cmd.colorscheme(selection.value)
            actions.close(prompt_bufnr)
         end)

         actions.move_selection_next:enhance { post = function()
            local selection = action_state.get_selected_entry()
            vim.cmd.colorscheme(selection.value)
         end }
         actions.move_selection_previous:enhance { post = function()
            local selection = action_state.get_selected_entry()
            vim.cmd.colorscheme(selection.value)
         end }
         return true
      end,

   }):find()
end

return open
