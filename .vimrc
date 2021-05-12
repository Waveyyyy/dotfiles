set number

set expandtab
set autoindent
set softtabstop=4
set shiftwidth=2
set tabstop=4

"Enable mouse click for nvim
set mouse=a
"Fix cursor replacement after closing nvim
set guicursor=
"Shift + Tab does inverse tab
inoremap <S-Tab> <C-d>

 " basic sensible defaults
     set nocompatible
     filetype off
     syntax on
     set encoding=utf-8
     set backspace=2
     set number
     set relativenumber
 
     " show commands as you're typing them
     set showcmd
     " jump to matching bracket briefly on insert
     set showmatch
     " dont redraw during macros, runs them faster
     set lazyredraw
 
 " tabs
     " always use 4 spaces as tab
     set expandtab
     set tabstop=4
     set softtabstop=4
     set shiftwidth=4
 
 " searching
     " highlight incrementally
     set incsearch
     " highlight results
     set hlsearch
     " no capitals searches case insensitive, caps are
     set smartcase ignorecase

 " neovim option to show command changes incrementally
     set inccommand=nosplit
