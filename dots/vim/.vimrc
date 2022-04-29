" _    _                                     _                    
"| |  | |                                   (_)                   
"| |  | | __ ___   _____  ___ ___     __   ___ _ __ ___  _ __ ___ 
"| |/\| |/ _` \ \ / / _ \/ __/ __|    \ \ / / | '_ ` _ \| '__/ __|
"\  /\  / (_| |\ V /  __/\__ \__ \     \ V /| | | | | | | | | (__ 
" \/  \/ \__,_| \_/ \___||___/___/    (_)_/ |_|_| |_| |_|_|  \___|


" colour things
    syntax on
    set omnifunc=syntaxcomplete#Complete


" numbering
    set number   
    set relativenumber


" random defaults
    set nocompatible
    set encoding=utf-8
    set backspace=2
    " show commands as you're typing them
    set showcmd
    " jump to matching bracket briefly on insert
    set showmatch
    " dont redraw during macros, runs them faster
    set lazyredraw
    " no soundeffects
    set noerrorbells
    " lines continue off screen
    set nowrap
    " no save required when switching buffers
    set hidden


" show autocomplete menu while typing a command
    set wildmenu
    " ignores case for autocomplete
    set wildignorecase
    set completeopt=preview
    set wildmode=longest,list,full


" tabs
    " always use 4 spaces as tab
    set expandtab
    set tabstop=4 softtabstop=4
    set shiftwidth=4
    set smarttab
    set shiftround
    set autoindent
    set smartindent
    " tab completion for files, including subfolders
    set path+=**
    " tabs navigation
    nmap <silent> <Tab> :tabn<CR>
    nmap <silent> <S-Tab> :tabp<CR>


" no need for this bcos VCS
    set nobackup
    set nowritebackup
    set noswapfile

" replace for backups
    set undodir=~/.vim/undodir
    set undofile

" make searching less insanity inducing
    set ignorecase
    set smartcase
    set incsearch
    set showmatch
    set hlsearch
    " always use global when substituting (add /g at end of s command to only
    " replace first occurrence)
    set gdefault
    " more sane regex for searching
    " removes need to escape chars for regex in search
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
    let mapleader = " "

    
" remap some keys for easier access
    " allows for exiting command mode without needing to reach for escape
    inoremap jf <esc>
    " remove the need to press shift to enter command mode
    nnoremap ; :
    vnoremap ; :
    " remove highlighting when done with search
    autocmd VimEnter * nnoremap <silent> <C-h> :noh<return><esc>
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
    " add blank lines without leaving normal mode
    nnoremap <silent> <leader><Return> :put _<CR>


" settings specific to languages
    " save and run a python file with the f5 key
        autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
        autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>
    " run the black linter over the file
        autocmd FileType python map <buffer> <F6> :w<CR>:exec '!python3 -m black' shellescape(@%, 1)<CR>
        autocmd FileType python imap <buffer> <F6> <esc>:w<CR>:exec '!python3 -m black' shellescape(@%, 1)<CR>


" window navigation
    nmap <C-H> <C-w>h
    nmap <C-J> <C-w>j
    nmap <C-K> <C-w>k
    nmap <C-L> <C-w>l


" buffer navigation
    nmap <silent> <C-N> :bn<CR>
    nmap <silent> <C-P> :bp<CR>


" Highlight the 80th column
    if (exists('+colorcolumn'))
        set colorcolumn=80
        highlight ColorColumn ctermbg=9
    endif

 " hex editing
    " bind command for calling hex mode function
    command -bar Hexmode call ToggleHex()
    
    " hex editing toggle function
    function ToggleHex()
        if !exists("b:editingHex") || !b:editingHex
            " set status
            let b:editingHex=1
            " switch to hex editor
            %!xxd
        else
            " set status
            let b:editingHex=0
            " switch to hex editor
            %!xxd -r
        endif
    endfunction
    
    " bind ctrl+B to toggle hex mode in 
    nnoremap <C-B> :Hexmode<CR>
    inoremap <C-B> <Esc>:Hexmode<CR>
    vnoremap <C-B> :<C-U>Hexmode<CR>
