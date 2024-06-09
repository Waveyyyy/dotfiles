-- Autocommand help see :h api-autocmd
-- Wrap text for certain filetypes at 80 chars
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' },
    {
        pattern = { '*.md', '*.c', '*.h', '*.cpp', '*.hpp' },
        callback = function()
            local lset = vim.opt_local
            lset.textwidth = 80
            lset.wrapmargin = 0
            lset.formatoptions:append('t')
            lset.linebreak = true
        end
    }
)

-- Hex-editing function
-- Stolen form @Sam1ser and adapted to Lua by myself
-- Link: https://github.com/Samiser/dotfiles/blob/master/dots/vim/.vimrc
vim.api.nvim_create_user_command('Hexmode',
    function()
        if vim.b.editingHex == nil or vim.b.editingHex == false then
            -- start hex editing, status on
            vim.b.editingHex = true
            -- switch to hex editor
            vim.fn.execute([[ %!xxd ]], false)
        else
            -- stop hex editing, status off
            vim.b.editingHex = false
            -- switch back to non hex view
            vim.fn.execute([[ %!xxd -r ]], false)
        end
    end, {
    bang = true, -- function uses the bang (!) char
    bar = true, -- function can be followed by a pipe (|) to run another command
}
)
