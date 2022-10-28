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
map('n', '<Tab>', ':tabn<CR>')
map('n', '<S-Tab>', ':tabp<CR>', { silent = true })

-- Removes need to escape chars for regex in search mode
map('n', '/', '/\v', { noremap = true })
map('v', '/', '/\v', { noremap = true })


-- fold using ctrl-f instead of za
map('n', '<C-F>', 'za', { noremap = true })

-- QOL
    -- Rebind escape to jf
    map('i', 'jf', '<esc>', { noremap = true})

    -- Window navigation
    map('n', '<C-H>', '<C-w>h')
    map('n', '<C-J>', '<C-w>j')
    map('n', '<C-K>', '<C-w>k')
    map('n', '<C-L>', '<C-w>l')

    -- Buffer navigation
    map('n', '<C-N>', ':bn<CR>', { silent = true })
    map('n', '<C-P>', ':bp<CR>', { silent = true })

    -- Add blank lines without leaving normal mode
    map('n', '<leader><Return>', ':put _<CR>', { noremap = true })

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
map('n', '<C-B>', ':Hexmode<CR>', { noremap = true})
map('i', '<C-B>', '<Esc>:Hexmode<CR>', { noremap = true})
map('v', '<C-B>', '<C-U>:Hexmode<CR>', { noremap = true})


-- Auto commands

    -- remove highlighting when done with search
    vim.api.nvim_create_autocmd({ 'VimEnter' },
        {
            pattern = { '*' },
            callback = function ()
                map('n', '<C-h>', ':noh<CR>', { noremap = true })
            end
        }
    )

    vim.api.nvim_create_autocmd({ 'BufWritePost'  },
        {
            pattern = { '*' },
            callback = function ()
               vim.lsp.buf.formatting()
            end
        }
    )
