## Assignment 2

#!/bin/bash

# Function to check disk usage in a given directory
check_disk_usage() {
    local directory=$1
    local list_files=false
    local top_entries=8

    # Parse command line arguments
    while getopts ":d:n:" opt; do
        case $opt in
            d) list_files=true;;
            n) top_entries=$OPTARG;;
            \?) echo "Invalid option: -$OPTARG" >&2;;
        esac
    done

    # Remove the command line arguments from the argument list
    shift $((OPTIND - 1))

    # Check disk usage
    if $list_files; then
        du -ah --max-depth=1 "$directory" | sort -hr | head -n "$top_entries"
    else
        du -h --max-depth=1 "$directory" | sort -hr | head -n "$top_entries"
    fi
}

# Example usage
check_disk_usage /var -n 5
check_disk_usage /var -d

#!/bin/bash

# Function to create a backup of a given directory
create_backup() {
    local source="$1"
    local destination="$2"
    local timestamp=$(date +%Y%m%d%H%M%S)
    local backup_file="backup_$timestamp.tar.gz"

    tar -czf "$destination/$backup_file" "$source"
    echo "Backup created: $destination/$backup_file"
}
# Example usage
create_backup /var/log /tmp



