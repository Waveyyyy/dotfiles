alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias up="ls && ip a | egrep \"inet[^6]\" | awk '{if (\$2 != \"127.0.0.1/8\"){ print \$2; }}' | cut -d \"/\" -f 1 && sudo python3 -m http.server 80"
alias listener='nc -lvnp'
alias thmux='tmux new -s thm'
alias thm='sudo openvpn ~/vpn/Wavess-thm.ovpn'
alias htbs='sudo openvpn ~/vpn/starting-point-Wavess.ovpn'
alias nclip='cat nmap/initial | xclip -selection clipboard'
