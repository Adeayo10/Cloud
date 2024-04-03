#!/bin/bash

# Set the file path to save memory usage
memory_file="/path/to/memory_usage.txt"

# Set the email address to send the memory usage report
email_address="your_email@example.com"

# Get the current hour
current_hour=$(date +%H)

# Check if it's midnight (hour 00)
if [[ $current_hour == "00" ]]; then
    # Send the memory usage report via email
    cat "$memory_file" | mail -s "Memory Usage Report" "$email_address"
    
    # Clear the memory file for the new day
    > "$memory_file"
fi

# Get the memory usage and append it to the memory file
free -m | grep Mem | awk '{print $3}' >> "$memory_file"
```