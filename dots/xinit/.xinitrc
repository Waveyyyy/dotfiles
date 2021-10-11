#!/bin/sh
# __          __                         __   ___       _ _   
# \ \        / /                         \ \ / (_)     (_) |  
#  \ \  /\  / /_ ___   _____  ___ ___     \ V / _ _ __  _| |_ 
#   \ \/  \/ / _` \ \ / / _ \/ __/ __|     > < | | '_ \| | __|
#    \  /\  / (_| |\ V /  __/\__ \__ \  _ / . \| | | | | | |_ 
#     \/  \/ \__,_| \_/ \___||___/___/ (_)_/ \_\_|_| |_|_|\__|
#                                                                             
# File that runs on boot with setup stuff

# Source the xprofile file
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

exec ck-launch-session dbus-launch --sh-syntax --exit-with-session /bin/i3
