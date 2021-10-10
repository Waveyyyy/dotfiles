# Remap old commands to modern variations
alias ls='exa '
alias ll='exa -l'
alias la='exa -la'
alias cat='bat'
alias curl='http'

# hacking specific aliases
alias up="exa -a && ip a | egrep \"inet[^6]\" | awk '{if (\$2 != \"127.0.0.1/8\"){ print \$2; }}' | cut -d \"/\" -f 1 && sudo python3 -m http.server 80"
alias listener='nc -lvnp'


# functions for making my life easier

function vpn {
    # search vpn file for file containing string entered
    # and run it with openvpn
    sudo openvpn $(find ~/vpn/ -name ""$1"*")
}

function ccompile {
    # grab the filename and strip any extension off
    # compile filename.c and give outfile the same name with no extension
    filename=$(echo "$1" | cut -d '.' -f 1 )
    gcc "$filename".c -o "$filename"
}
