" _    _                                     _                    
"| |  | |                                   (_)                   
"| |  | | __ ___   _____  ___ ___     __   ___ _ __ ___  _ __ ___ 
"| |/\| |/ _` \ \ / / _ \/ __/ __|    \ \ / / | '_ ` _ \| '__/ __|
"\  /\  / (_| |\ V /  __/\__ \__ \     \ V /| | | | | | | | | (__ 
" \/  \/ \__,_| \_/ \___||___/___/    (_)_/ |_|_| |_| |_|_|  \___|
                                                                 
                                                                 

" colour scheme
    syntax enable
    colorscheme gruvbox
    :set bg=dark


" numbering
    set number   
    set relativenumber


" random defaults
    set nocompatible
    filetype off
    set encoding=utf-8
    set backspace=2
    filetype plugin on
    " show commands as you're typing them
    set showcmd
    " jump to matching bracket briefly on insert
    set showmatch
    " dont redraw during macros, runs them faster
    set lazyredraw


" show autocomplete menu while typing a command
    set wildmenu
    " ignores case for autocomplete
    set wildignorecase
    set completeopt=preview
    set wildmode=longest,list,full


" tabs
    " always use 4 spaces as tab
    set expandtab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set smarttab
    set shiftround
    set autoindent
    set smartindent
    " tab completion for files, including subfolders
    set path+=**


" no need for this bcos VCS
    set nobackup
    set nowritebackup
    set noswapfile


" make searching less insanity inducing
    set ignorecase
    set smartcase
    set incsearch
    set showmatch
    set hlsearch
    set gdefault
    " more sane regex for searching
    nnoremap / /\v
    vnoremap / /\v

" display ruler on the bottom right corner
    set ruler

    
" auto-update file if modified externally
    set autoread


" performance improvement, only redraw screen if required
    set lazyredraw


" settings that enable code folding
    set foldenable
    set foldlevelstart=10
    set foldmethod=indent
    " fold using ctrl-f instead of za
    nnoremap <C-F> za


" always have some lines after EOF for easier reading
    set scrolloff=10


" allows for own namespace of keybinds
    let mapleader = ","

    
" remap some keys for easier access
    " allows for exiting command mode without needing to reach for escape
    inoremap jf <esc>
    " remove the need to press shift to enter command mode
    nnoremap ; :
    vnoremap ; :
    " keep cursor in middle of the page
    nnoremap <C-U> 11kzz
    nnoremap <C-D> 11jzz
    nnoremap j jzz
    nnoremap k kzz
    nnoremap # #zz
    nnoremap * *zz
    nnoremap n nzz
    nnoremap N Nzz
    nnoremap gg ggzz
    nnoremap G Gzz
    nnoremap gj gjzz
    nnoremap gk gkzz


" settings specific to languages
    " spell checking in markdown and text files
        autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_gb
        autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_gb
