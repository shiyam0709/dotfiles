#!/bin/bash

while true; do
    # Get the battery percentage
    battery_percentage=$(cat /sys/class/power_supply/BAT0/capacity)

    # Check if the battery is below 20%
    if [ "$battery_percentage" -le 20 ]; then
        # Send a notification with the battery percentage
        notify-send "Battery Warning" "Battery is at ${battery_percentage}%. Please plug in your charger."
    fi

    # Wait for 5 mins before checking again
    sleep 300
done

