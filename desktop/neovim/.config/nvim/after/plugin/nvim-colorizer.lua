-- This file must be below the call to plugins.vim

-- Fixes &termguicolors must be set errors
vim.opt.termguicolors = true

-- Creates an autocmd for every filetype
require'colorizer'.setup()
