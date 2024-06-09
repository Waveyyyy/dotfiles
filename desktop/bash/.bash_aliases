alias cat='bat' # https://github.com/sharkdp/bat
alias ls='eza' # https://github.com/eza-community/eza


function dots()
{
	a=$(find ~/dotfiles/desktop -type f | fzf -0 --preview='bat --color=always {}' --)
	if [[ "$?" == 0 ]]; then 
		nvim "$a"
	fi
}
