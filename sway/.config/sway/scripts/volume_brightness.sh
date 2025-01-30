
#!/bin/bash


# Get current volume percentage and mute status using wpctl
if command -v wpctl &>/dev/null; then
    volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%.0f", $2 * 100}')
    mute_status=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o 'MUTED')
    if [[ $mute_status == "MUTED" ]]; then
        volume="Muted"
    else
        volume="${volume}%"
    fi
else
    volume="Unavailable"
fi

# Get current brightness percentage using brightnessctl
if command -v brightnessctl &>/dev/null; then
    current_brightness=$(brightnessctl get)
    max_brightness=$(brightnessctl max)
    brightness=$((current_brightness * 100 / max_brightness))
else
    brightness="Unavailable"
fi
# Show notification
notify-send "Volume & Brightness" "Volume: ${volume}\nBrightness: ${brightness}%"
