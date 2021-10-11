# _    _                                      _              
#| |  | |                                    | |             
#| |  | | __ ___   _____  ___ ___     _______| |__  _ __ ___ 
#| |/\| |/ _` \ \ / / _ \/ __/ __|   |_  / __| '_ \| '__/ __|
#\  /\  / (_| |\ V /  __/\__ \__ \  _ / /\__ \ | | | | | (__ 
# \/  \/ \__,_| \_/ \___||___/___/ (_)___|___/_| |_|_|  \___|
                                                            

# Set colours based on wallpaper
(/usr/bin/cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh


# Enable colours
autoload -U colors && colors


# Set prompt
export PROMPT='[%F{magenta}%n%F{yellow}@%F{magenta}%M%F{white}:%F{cyan}%1~%F{white}]$ '


# OMZ stuff

    # If you come from bash you might have to change your $PATH.
    export PATH=$HOME/bin:/usr/local/bin:$PATH

    # Path to your oh-my-zsh installation.
    export ZSH="/home/waves/.oh-my-zsh"
    ZSH_THEME="robbyrussell"


    plugins=(
        git
        zsh-autosuggestions
        zsh-syntax-highlighting
        colored-man-pages
        gitignore
        sudo
        dirhistory
        vi-mode
    )

    # vi-mode settings
    VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
    VI_MODE_SET_CURSOR=true
    


    source $ZSH/oh-my-zsh.sh

    # Aliases
    test -f ~/.bash_aliases && source ~/.bash_aliases

export LANG=en_US.UTF-8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
