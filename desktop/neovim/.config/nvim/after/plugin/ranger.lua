-- Open ranger when vim opens a directory
vim.g.ranger_replace_netrw = 1

-- use leader key shift and f to open ranger in a new tab
vim.api.nvim_set_keymap("n", "<leader><S-F>", ":RangerNewTab<CR>", { noremap = true })
