" Add the dein install directory into the runtimepath
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

function! DoRemote()
    UpdateRemotePlugins
endfunction

filetype off

if dein#load_state('~/.config/nvim/dein')
    call dein#begin('~/.config/nvim/dein')
endif

" Plugin list

    " Ranger integration
    call dein#add('francoiscabrol/ranger.vim')
    " Required by neovim for ranger
    call dein#add('rbgrouleff/bclose.vim')
    
    " Fuzzy Finder
    call dein#add('junegunn/fzf.vim')

    " Language Support
    call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})

    " Themeing
"    call dein#add('phanviet/vim-monokai-pro')
    call dein#add('folke/tokyonight.nvim')
" Key-menu popup
    call dein#add('liuchengxu/vim-which-key')

    " Better syntax support
    call dein#add('sheerun/vim-polyglot')

    " Statusline
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')

    " File Explorer
    call dein#add('scrooloose/NERDTree')

    " Comments
    call dein#add('scrooloose/nerdcommenter')

    " Icons
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')

    " Git support
    call dein#add('Xuyuanp/nerdtree-git-plugin')

    " Start Screen
    call dein#add('mhinz/vim-startify')

    " Tagbar
    call dein#add('majutsushi/tagbar')

    " Auto bracket pairs
    call dein#add('jiangmiao/auto-pairs')
    
    " Sneak (movement key)
    call dein#add('justinmk/vim-sneak')

    " Git diff markers
    call dein#add('airblade/vim-gitgutter')
    " Gitwrapper
    call dein#add('tpope/vim-fugitive')

    " delete all buffers except current/named ones
    call dein#add('vim-scripts/BufOnly.vim')

    " Distraction free writing
    call dein#add('junegunn/goyo.vim')
    call dein#add('junegunn/limelight.vim')

    " Colouriser
    call dein#add('norcalli/nvim-colorizer.lua')

    " Find and Replace
    call dein#add('brooth/far.vim')


    if !has('nvim')
        " yet another remote plugin framework
        call dein#add('roxma/nvim-yarp')
    endif

call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
 call dein#install()
endif
