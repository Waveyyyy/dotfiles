" Link vimrc to nvim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Config for specific plugins
source $HOME/.config/nvim/modules/airline.vim
source $HOME/.config/nvim/modules/coc.vim
source $HOME/.config/nvim/modules/vim-which-key.vim
source $HOME/.config/nvim/modules/ranger.vim
source $HOME/.config/nvim/modules/nerdcommenter.vim
source $HOME/.config/nvim/modules/vim-sneak.vim
source $HOME/.config/nvim/modules/limelight.vim

" Load all plugins
source $HOME/.config/nvim/plugs/plugins.vim

" Load configs that need to be sourced after plugins
source $HOME/.config/nvim/modules/vim-monokai-pro.vim
source $HOME/.config/nvim/modules/nvim-colorizer.vim
