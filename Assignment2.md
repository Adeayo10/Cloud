
## Assignment 2

# 1.

Write a shell script that checks the disk usage in a given directory.
the script can take two optional arguments and one compulsory argument...
-d: which means that all files and directory within the specified directory or directories should be listed.
-n: which means that the top N enteries should be returned.
list of directories: this will be the directories you want to check it's disk usage
eg yourscript.sh -n 5 /var
should return the top 5 directories wrt disk usage in /var directory
yourscript.sh -d /var
should list both directories and files
Note: if -n argument is not given, it should return 8 enteries by default.

# 2.

Create a backup script. This script creates a backup of a given directoryand saves it in another directory with a timestamp. It takes two arguments:
the source directory and the destination directory
Note: The backup should be a tar archive

# Function to check disk usage in a given directory

#!/bin/bash

check_disk_usage()
{
    </br>
    local list_files=false</br>
    local top_entries=8

    ### Parse command line arguments

    while getopts "dn:" opt; do
        case $opt in
            d) 
                list_files=true;;
            n)
                top_entries=$OPTARG;;
            \?)
                echo "Invalid option: -$OPTARG" >&2;;
        esac
    done

    #### echo "$list_files"
    #### echo "$top_entries"

    shift $((OPTIND - 1))
    for directory in "$@";do
        if [ "$list_files" = true ]; then
            entry=$(sudo find "$directory" -type f -exec du -Sh {} + | sort -rh | head -n "$top_entries")
            echo "$entry"
        else
            entry=$(du -h "$dir" 2>/dev/null | sort -rh | head -n "$top_entries")
        echo "$entry"
        fi
        #echo "$enteries"
    done
}

# Example usage

check_disk_usage -d -n 10 /var/log

# Output:

4.0K /var/log/lastlog </br>
4.0K /var/log/ntpstats </br>
4.0K /var/log/samba </br>
4.0K /var/log/tuned </br>
4.0K /var/log/chrony </br>
4.0K /var/log/ConsoleKit </br>
4.0K /var/log/plymouth </br>
4.0K /var/log/private </br>
4.0K /var/log/sa </br>
4.0K /var/log/sssd </br>

# Function to create a backup of a given directory

create_backup() {
</br>

    local source="$1"
    local destination="$2"
    local timestamp=$(date +%Y%m%d%H%M%S)
    local backup_file="backup_$timestamp.tar.gz"

    tar -czf "$destination/$backup_file" "$source"
    echo "Backup created: $destination/$backup_file"

}

# Example usage

create_backup /var/log /tmp

# Output:

Backup created: /tmp/backup_20210301123456.tar.gz
