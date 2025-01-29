#!/bin/bash

# Get battery percentage and status
battery_status=$(cat /sys/class/power_supply/BAT0/status)
battery_percentage=$(cat /sys/class/power_supply/BAT0/capacity)

# Get EPP profile
epp_profile=$(cat /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference)

# Create a message with all the information
message="Percentage: $battery_percentage% ($battery_status)\nEPP Profile: $epp_profile"

# Send notification
notify-send "Battery Status" "$message"

