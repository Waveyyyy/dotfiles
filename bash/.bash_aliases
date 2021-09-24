alias ls='exa'
alias ll='exa -l'
alias la='exa -la'
alias up="exa -a && ip a | egrep \"inet[^6]\" | awk '{if (\$2 != \"127.0.0.1/8\"){ print \$2; }}' | cut -d \"/\" -f 1 && sudo python3 -m http.server 80"
alias listener='nc -lvnp'
alias nclip='cat nmap/initial | xclip -selection clipboard'
