## Assignment 2

1.  Write a shell script that checks the disk usage in a given directory.
    the script can take two optional arguments and one compulsory argument...
    -d: which means that all files and directory within the specified directory or directories should be listed.
    -n: which means that the top N enteries should be returned.
    list of directories: this will be the directories you want to check it's disk usage

2.  Create a backup script. This script creates a backup of a given directory and saves it in another directory with a timestamp. It takes two arguments:
    the source directory and the destination directory
    Note: The backup should be a tar archive

## Answers

#!/bin/bash

```bash
# Function to check disk usage in a given directory
check_disk_usage() {
    local directory=$1
    local n=8
    local optstring=":d:n:"
    while getopts $optstring opt;
    do
        case $opt in
            d) directory=$OPTARG;;
            n) n=$OPTARG;;
            \?) echo "Invalid option: -$OPTARG" >&2;;
        esac
    done
    du -h $directory | sort -rh | head -$n
}
example
check_disk_usage /home/altschool -d -n 5
```
# Output
```bash
4.0K    /home/altschool/backup
```
```bash
# Function to create a backup of a given directory
create_backup() {
    local source="/home/vagrant/altschool"
    local backup_dir="/home/vagrant/backup"
    local timestamp=$(date +%Y%m%d%H%M%S)
    local backup_file="backup_$timestamp.tar.gz"
    local optstring=":s:d:"
    while getopts $optstring opt;
    do
        case $opt in
            s) source=$OPTARG;;
            d) backup_dir=$OPTARG;;
            \?) echo "Invalid option: -$OPTARG" >&2;;
        esac
    done
    tar -czf $backup_dir/$backup_file $source
    echo "$backup_dir/$backup_file"
}
example
create_backup /home/vagrant/altschool /home/vagrant/altschool/backup
```
# Output
```bash
/home/altschool/backup/backup_20210819123456.tar


