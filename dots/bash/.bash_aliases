# Remap old commands to modern variations
alias ls='exa '
alias ll='exa -l'
alias la='exa -la'
alias cat='bat'

# use neovim on void 
alias vim='nvim'

# trilium run from terminal without spamming output (im cba remembering the full command :) )
alias trilium='trilium >/dev/null 2>&1 &'


# functions for making my life easier

function vpn {
    # quickly run vpn
    sudo wg-quick $1 $(find ~/vpn/ -name "*$2*")
}

function ccompile {
    # grab the filename and strip any extension off
    # compile filename.c and give outfile the same name with no extension
    filename=$(find . -name "*.c" | rev | cut -d '.' -f 2- | rev)
    gcc "$filename".c -o "$filename"
}

function asm {
    # quickly compile asm to a binary
    filename=$(find ~/Programming/assembly/"$1" -name "*.asm" | rev | cut -d '.' -f 2- | rev)
    nasm -f elf ~/Programming/assembly/"$1"/"$filename".asm
    ld -m elf_i386 -s -o ~/Programming/assembly/"$1"/$filename ~/Programming/assembly/"$1"/"$filename".o
}
