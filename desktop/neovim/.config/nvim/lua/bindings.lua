-- Slightly adapted from reddit reply
-- Link: https://www.reddit.com/r/neovim/comments/umnc45/comment/i82qc0z/?utm_source=share&utm_medium=web2x&context=3
local function map(mode, lhs, rhs, opts)
  local options = { noremap = false }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  -- above code allows for opts to be quite literally optional
  -- if opts is not provided then options will contain only
  -- { noremap = false }
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Easily create keybindings for centering cursor on movement
local function centaur(keycombo, extra)
  local centre = 'zz'
  local movement = ''
  if extra then
    movement = extra .. centre
  else
    movement = keycombo .. centre
  end

  map('n', keycombo, movement, { noremap = true })
end

-- Bind leader key to space
vim.g.mapleader = ' '


-- Navigate tabs
-- tabfwd: Tab
-- tabbck: Shift-Tab
map('n', '<Tab>', ':tabn<CR>', { desc = "Navigate forward through tabs" })
map('n', '<S-Tab>', ':tabp<CR>', { silent = true, desc = "Navigate backwards through tabs" })

-- Removes need to escape chars for regex in search mode
map('n', '/', '/\\v', { noremap = true, desc = "[normal] Removes need to escape chars for regex in search mode" })
map('v', '/', '/\\v', { noremap = true, desc = "[visual] Removes need to escape chars for regex in search mode" })


-- fold using ctrl-f instead of za
map('n', '<C-F>', 'za', { noremap = true })

-- QOL
-- Rebind escape to jf
map('i', 'jf', '<esc>', { noremap = true })

-- Window navigation
map('n', '<C-H>', '<C-w>h')
map('n', '<C-J>', '<C-w>j')
map('n', '<C-K>', '<C-w>k')
map('n', '<C-L>', '<C-w>l')

-- Buffer navigation
map('n', '<C-N>', ':bn<CR>', { silent = true })
map('n', '<C-P>', ':bp<CR>', { silent = true })

-- Add blank lines without leaving normal mode
map('n', '<leader><Return>', ':put _<CR>', { noremap = true, desc = "Add blank lines without leaving normal mode" })

-- Centre crosshair on movement
centaur('<C-U>', '11k')
centaur('<C-D>', '11j')
centaur('#')
centaur('*')
centaur('n')
centaur('N')
centaur('gg')
centaur('G')
centaur('gj')
centaur('gk')


-- Bind ctrl+B to toggle hex editing mode
-- From @Sam1ser, link: https://github.com/Samiser/dotfiles/blob/master/dots/vim/.vimrc
map('n', '<C-B>', ':Hexmode<CR>', { noremap = true, desc = "[normal] Converts the current buffer to/from hex" })
map('i', '<C-B>', '<Esc>:Hexmode<CR>', { noremap = true, desc = "[insert] Converts the current buffer to/from hex" })
map('v', '<C-B>', '<C-U>:Hexmode<CR>', { noremap = true, desc = "[visual] Converts the current buffer to/from hex" })
--------------------------------------------------------------------------------
---------------------------------Auto commands----------------------------------
--------------------------------------------------------------------------------

-- remove highlighting when done with search
vim.api.nvim_create_autocmd({ 'VimEnter' },
  {
    pattern = { '*' },
    callback = function()
      map('n', '<C-h>', ':noh<CR>',
        { noremap = true, desc = "Remove highlight with ctrl-h when done viewing search results" })
    end
  }
)

-- format a file when it is saved
vim.api.nvim_create_autocmd({ 'BufWritePost' },
  {
    pattern = { '*.c', '*.h', '*.lua' },
    callback = function()
      vim.lsp.buf.format { async = false }
    end
  }
)

--------------------------------------------------------------------------------
----------------------------------Telescope-------------------------------------
--------------------------------------------------------------------------------

-- setting buffer to zero will cause issues when switching files with find_files

--vim.keymap.set('n', '<leader>fc', function()
--  -- search current file using Telescope in ascending order with the ivy theme
--  local opt = require('telescope.themes').get_ivy({ sorting_strategy = "ascending" })
--  require('telescope.builtin').current_buffer_fuzzy_find(opt)
--end, { noremap = true, desc = "[Telescope] Search the content of the current file" })

vim.keymap.set('n', '<leader>nh', function()
  -- search the all of the neovim help files using telescope
  local opt = require('telescope.themes').get_ivy({ sorting_strategy = "ascending" })
  require('telescope.builtin').help_tags(opt)
end, { noremap = true, desc = "[Telescope] Search through the neovim help files" })

vim.keymap.set('n', '<leader>km', function()
  require('telescope.builtin').keymaps()
end, { noremap = true, desc = "[Telescope] Search through all keymaps" })

vim.keymap.set('n', '<leader>td', function()
  local opt = require('telescope.themes').get_dropdown({ sorting_strategy = "ascending"})
  require('telescope.builtin').diagnostics(opt)
end, { noremap = true, desc = "[Telescope] Search the diagnostics in current file" })

--vim.keymap.set('n', '<leader>fd', function()
--  local opt = { hidden = true }
--  require('telescope.builtin').find_files(opt)
--end, { noremap = true, desc = "[Telescope] Search for files in current directory" })
--
--vim.keymap.set('n', '<leader>ff', function()
--  local opt = { hidden = true, cwd = '~' }
--  require('telescope.builtin').find_files(opt)
--end, { noremap = true, desc = "[Telescope] Search for files in the current users home directory" })
