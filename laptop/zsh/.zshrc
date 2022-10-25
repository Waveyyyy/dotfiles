# _    _                                      _              
#| |  | |                                    | |             
#| |  | | __ ___   _____  ___ ___     _______| |__  _ __ ___ 
#| |/\| |/ _` \ \ / / _ \/ __/ __|   |_  / __| '_ \| '__/ __|
#\  /\  / (_| |\ V /  __/\__ \__ \  _ / /\__ \ | | | | | (__ 
# \/  \/ \__,_| \_/ \___||___/___/ (_)___|___/_| |_|_|  \___|
                                                            
### Removed because using tokyonight theme for kitty
# Set colours based on wallpaper
# (/usr/bin/cat ~/.cache/wal/sequences &)
# source ~/.cache/wal/colors-tty.sh


# Enable colours
# autoload -U colors && colors


# Set prompt
# export PROMPT='[%F{magenta}%n%F{yellow}@%F{magenta}%M%F{white}:%F{cyan}%1~%F{white}]$ '


# OMZ stuff

    # If you come from bash you might have to change your $PATH.
    export PATH=$HOME/.nimble/bin:/opt/jdk11/bin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/.local/bin:/usr/bin:$HOME/.fzf/bin:$HOME/.local/bin:/usr/bin:/opt

    # Path to your oh-my-zsh installation.
    export ZSH="$HOME/.oh-my-zsh"
    ZSH_THEME="agnoster"

    zstyle ':omz:update' mode reminder

    plugins=(
        git
        zsh-autosuggestions
        zsh-syntax-highlighting
        colored-man-pages
        gitignore
        sudo
        dirhistory
        fzf-zsh-plugin
    )


    source $ZSH/oh-my-zsh.sh

    # Aliases
    test -f ~/.bash_aliases && source ~/.bash_aliases

    # Python virtual env stuff
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/projects
    source /home/waves/.local/bin/virtualenvwrapper.sh

export LANG=en_US.UTF-8
export TZ=Europe/London
export HARDWARECLOCK=localtime

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
else
    export EDITOR='nvim'
fi

# Load profile file
if [ -f ~/.profile ]; then
    . ~/.profile
fi

# fzf plugin stuff
export FZF_PREVIEW_ADVANCED=true
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s"

export PATH=$PATH:/home/waves/.spicetify
