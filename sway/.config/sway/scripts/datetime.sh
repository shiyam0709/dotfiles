
#!/bin/bash

# Get current time, date, and day
current_time=$(date +"%I:%M %p")
current_date=$(date +"%d-%m-%Y")
current_day=$(date +"%A")

# Display notification
notify-send "Current Date & Time" "Time: $current_time\nDate: $current_date\nDay: $current_day"
