alias vim='nvim'
alias cat='bat' # https://github.com/sharkdp/bat
alias ls='eza' # https://github.com/eza-community/eza

function dots
{
	a=$(find ~/dotfiles/desktop -maxdepth 1 -type d -name "*$1*" | xargs -I % find % -type f | fzf -0 --preview='bat --color=always {}' )
	if [[ "$?" == 0 ]]; then 
		nvim "$a"
	fi
}
