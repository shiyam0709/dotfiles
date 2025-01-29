#!/bin/bash

# Get the list of currently connected Bluetooth devices
connected_devices=$(bluetoothctl devices | while read -r line; do
  mac_address=$(echo $line | awk '{print $2}')
  device_name=$(echo $line | cut -d' ' -f3-)

  # Check if the device is connected
  connection_status=$(bluetoothctl info $mac_address | grep "Connected" | awk '{print $2}')

  if [[ "$connection_status" == "yes" ]]; then
    echo "$device_name ($mac_address) - Connected"
  fi
done)

if [[ -z "$connected_devices" ]]; then
  notify-send "Bluetooth Status" "No Bluetooth devices connected"
else
  notify-send "Bluetooth Status" "Connected Bluetooth devices:\n$connected_devices"
fi

# Get Wi-Fi connection status
status=$(nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d':' -f2)

if [[ -z "$status" ]]; then
  notify-send "Wi-Fi Status" "Not connected to any Wi-Fi network"
else
  # Get the signal strength
  signal_strength=$(nmcli -t -f SSID,SIGNAL dev wifi | grep "$status" | cut -d: -f2)

  if [[ -z "$signal_strength" ]]; then
    notify-send "Wi-Fi Status" "Error fetching signal strength"
  else
    # Display the Wi-Fi status and signal strength
    notify-send "Wi-Fi Status" "Connected to: $status\nSignal Strength: $signal_strength%"
  fi
fi
