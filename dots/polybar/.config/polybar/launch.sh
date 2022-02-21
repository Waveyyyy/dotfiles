#!/usr/bin/env sh

# Terminate any currently running polybar processes
pkill polybar

# Launch polybar using the default config location: ~/.config/polybar/config
# polybar mybar 2>&1 | tee -a /tmp/polybar.log & disown
while pgrep -x polybar >/dev/null; do sleep 1; done

# polybar example &
polybar mybar &
