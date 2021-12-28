# Remap old commands to modern variations
alias ls='exa '
alias ll='exa -l'
alias la='exa -la'
alias cat='bat'

# use neovim
alias vim='nvim'

# trilium run from terminal without spamming output (i cba remembering the full command :) )
alias trilium='trilium >/dev/null 2>&1 &'


# functions for making my life easier

function home {
    sudo wg-quick $1 $(find ~/vpn/ -name "*$2*")
}

function vpn {
# search vpn file for file containing string entered
# and run it with openvpn
    sudo openvpn $(find ~/vpn/ -name "*"$1"*")
}

function asm {
    filename=$(find ~/Programming/assembly/"$1" -name "*.asm" | rev | cut -d '.' -f 2- | rev)
    nasm -f elf ~/Programming/assembly/"$1"/"$filename".asm
    ld -m elf_i386 -s -o ~/Programming/assembly/"$1"/$filename ~/Programming/assembly/"$1"/"$filename".o
}
