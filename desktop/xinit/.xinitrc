# Source the xprofile file
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# Launch i3 with dbus
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session /bin/i3
