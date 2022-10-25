#!/usr/bin/env bash

set -x

old_bat_percent=$(acpi -b | awk {'print $4'} | cut -d'%' -f1)

while true; do

    charging_status="$(acpi -b | awk {'print $3'} | cut -d',' -f1)"
    bat_percent="$(acpi -b | awk {'print $4'} | cut -d'%' -f1)"
    sleep_len="1m"

    if [[ `echo $charging_status` == "Discharging" ]]; then
    
        if [[ $bat_percent -le 20 && $old_bat_percent -ge 20 ]]; then
            notify-send -u critical "Battery low - $bat_percent%"

            old_bat_percent=$bat_percent
            sleep_len="2m"
        elif [[ $bat_percent  -le 10 && $old_bat_percent -ge 10 ]]; then
            notify-send -u critical "Battery low - $bat_percent%"

            old_bat_percent=$bat_percent
            sleep_len="2m"
        fi
    fi

    /usr/bin/sleep `echo $sleep_len`

done
