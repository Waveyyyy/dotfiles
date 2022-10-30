-- :h vim-differences to see differences between vim defaults and nvim
local set = vim.opt

-- syntax highlighting???? TODO: check what this does
set.omnifunc = 'syntaxcomplete#Complete'

-- Relative numbers
set.number = true
set.relativenumber = true

-- nice defaults 
set.showmatch = true -- briefly jump to paired bracket
set.lazyredraw = true -- dont redraw while running macros, runs faster
set.errorbells = false -- no sound effects
set.wrap = false -- lines continue off screen
set.hidden = true -- no save required when switching buffers

-- ignore case for autocomplete when typing commands
set.wildignorecase = true
set.completeopt = 'preview'
set.wildmode = { 'longest','list','full' }

-- tabs TODO: lookup what each of these does
set.expandtab = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.smarttab = true
set.shiftround = true
set.autoindent = true
set.smartindent = true

-- tab completion for files, including subfolders
set.path:append('**')

-- disable backups and swapfiles
set.backup = false
set.writebackup = false
set.swapfile = false
-- change undodir location undodir etc.
set.undodir = vim.fn.expand('~') .. '/.cache/nvim/undo'
set.undofile = true

-- make searching enjoyable
set.ignorecase = true
set.smartcase = true
set.showmatch = true
set.gdefault = true

-- Enable code folding options
set.foldenable = true
set.foldlevelstart = 10
set.foldmethod = 'syntax' -- manual, indent, expr, marker, syntax, diff

-- Highlight 80th column, helps with c, md and git commits
if (vim.fn.exists('+colorcolumn')) then
    set.colorcolumn = { 80 }
    vim.api.nvim_set_hl(0, 'ColorColumn', { ctermbg=9 })
end
