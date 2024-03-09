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

    # Check if the directory exists
    if [ ! -d "$directory" ]; then
        echo "Directory does not exist: $directory" >&2
        return 1
    fi
    if [ "$list_files" = true ]; then
        # List all files in the directory
        echo "The $top_entries largest files in $directory are:"
        du -a $directory 2> /dev/null | sort -n -r | head -n $top_entries
    else
        # Show the total disk usage of the directory
        echo "The total disk usage of $directory is:"
        du -sh $directory 2> /dev/null
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


