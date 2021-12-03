set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

source $HOME/.config/nvim/plugs/plugins.vim
