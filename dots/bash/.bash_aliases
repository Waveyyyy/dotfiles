# Remap old commands to modern variations
alias ls='exa '
alias ll='exa -l'
alias la='exa -la'
# alias cat='bat'
# alias curl='http'

# for clipboard in void
# alias vim='vim-huge'

# trilium run from terminal without spamming output (im cba remembering the full command :) )
alias trilium='trilium >/dev/null 2>&1 &'

# hacking specific aliases
alias up="exa -a && ip a | egrep \"inet[^6]\" | awk '{if (\$2 != \"127.0.0.1/8\"){ print \$2; }}' | cut -d \"/\" -f 1 && sudo python3 -m http.server 80"
alias listener='rlwrap nc -lvnp'
alias bloodhound='bloodhound --no-sandbox >/dev/null 2>&1 &'
alias openvas='docker run -d -p 443:443 --name openvas mikesplain/openvas'
alias remmina='sudo remmina >/dev/null 2>&1 &'

# ctf nmap scans
alias fullport='ports=$(nmap -p- --min-rate=2400 -T4 $IP | grep ^[0-9] | cut -d "/" -f 1 | tr "\n" "," | sed s/,$//)'
alias initial='nmap -sC -sV -p$ports -sT $IP -oN nmap/initial'


# functions for making my life easier

function vpn {
    # search vpn file for file containing string entered
    # and run it with openvpn
    sudo openvpn $(find ~/vpn/ -name "*"$1"*")
}

function ccompile {
    # grab the filename and strip any extension off
    # compile filename.c and give outfile the same name with no extension
    filename=$(find . -name "*.c" | rev | cut -d '.' -f 2- | rev)
    gcc "$filename".c -o "$filename"

}

