#!/usr/bin/env bash

prev_val=$(/bin/cat /sys/class/backlight/amdgpu_bl0/brightness)

new_val=$prev_val

if [ "$1" == "inc" ]; then
    new_val=$(($prev_val+$2))
elif [ "$1" == "set" ]; then
    new_val=$(($2))
elif [ "$1" == "help" ]; then
    /bin/printf "Usage: brightness [OPTION] [VALUE]\nIncrease monitor brightness\n\n  inc     Increments current value by supplied value\n  set     Set brightness to supplied value\n\nExamples:\n  brightness inc 10     Increases screen brightness by 10\n  brightness set 15     Sets screen brightness to 15\n"
else
    /bin/printf "Invalid argument '$1'\nTry 'brightness help' for more information.\n"
fi

/bin/echo $new_val > /sys/class/backlight/amdgpu_bl0/brightness 
