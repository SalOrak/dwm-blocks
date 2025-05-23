# Update battery status 
update_bat() {
    battery="BAT0"
    if [[ -e /sys/class/power_supply/$battery/status ]]; then
        bat_status=$(< /sys/class/power_supply/$battery/status)
        if [[ -e /sys/class/power_supply/$battery/capacity ]]; then
            bat_capacity=$(< /sys/class/power_supply/$battery/capacity)
            bat="$bat_status $bat_capacity%"
        else
            bat="$bat_status (capacity not available)"
        fi
    fi
}

update_bat
