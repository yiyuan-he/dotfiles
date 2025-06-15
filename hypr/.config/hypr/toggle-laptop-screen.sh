#!/bin/bash

LAPTOP=$(hyprctl monitors all | grep -E "Monitor.*eDP-1" | head -1 | awk '{print $2}')
STATE_FILE="/tmp/laptop_monitor_state"

if [ -f "$STATE_FILE" ]; then
    # File exists, monitor is disabled, turn it on
    hyprctl keyword monitor "$LAPTOP,preferred,auto,auto"
    rm "$STATE_FILE"
    notify-send "Monitor" "Laptop screen enabled"
else
    # File doesn't exist, monitor is on, turn it off
    hyprctl keyword monitor "$LAPTOP,disable" 
    touch "$STATE_FILE"
    notify-send "Monitor" "Laptop screen disabled"
fi
