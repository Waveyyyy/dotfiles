-- local action_state = require('telescope.actions.state') -- runtime (Plugin) exists as lua/telescope/actions/state.lua
require('telescope').setup {
  defaults = {
    prompt_prefix = "$ ",
    mappings = {
      i = {
        -- if results of print() dont show, check `:messages`
        -- ["<c-a>"] = function()
        --   print(vim.inspect(action_state.get_selected_entry()))
        -- end,
      },
    }
  },
  extensions = {
    -- allows [fzf syntax](https://github.com/junegunn/fzf#search-syntax) to be used
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    -- https://github.com/nvim-telescope/telescope-file-browser.nvim?tab=readme-ov-file#mappings
    file_browser = {
      --theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      -- mappings = {
      --   ["i"] = {
      -- your custom insert mode mappings
      --   },
      --   ["n"] = {
      -- your custom normal mode mappings
      --   },
      -- },
    },
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
