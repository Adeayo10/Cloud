# # directory=$4
# list_files=false
# top_entries=8

# # Parse command line arguments
# while getopts "dn:" opt; do
#     case $opt in
#         d) 
#             list_files=true;;
#         n)
#             top_entries=$OPTARG;;
#         \?) 
#             echo "Invalid option: -$OPTARG" >&2;;
#     esac
# done
# # echo "$list_files"
# # echo "$top_entries"
# shift $((OPTIND - 1))
# for directory in "$@";do
#     if [ "$list_files" = true ]; then
#         entry=$(sudo find "$directory" -type f -exec du -Sh {} + | sort -rh | head -n "$top_entries")
#         echo "$entry"
#     else
#         entry=$(du -h "$dir" 2>/dev/null | sort -rh | head -n "$top_entries")
#         echo "$entry"
#     fi
#     #echo "$enteries"
# done

#!/usr/bin/bash
# while read each_line
# do
#   echo $each_line
# done < input.txt


# var=1
# while [ $var -lt 6 ];do
#     echo "Adeayo"
#     today="Today's date is $(date):"
#     echo "$today"
#     ((var++))
# done

#!/bin/bash

# Set email parameters
recipient="aadelee74@gmail.com"
subject="Hello"
message="This is the body of the email."

# Send email using SMTP
echo "$message" | mail -s "$subject" "$recipient"

# touch /mnt/c/users/Adesoji/desktop/Altschool/second_seamester/cloud/cloud/memory_logs/file.log
# date >> /mnt/c/users/Adesoji/desktop/Altschool/second_seamester/cloud/cloud/memory_logs/file.log
# free -m >> /mnt/c/users/Adesoji/desktop/Altschool/second_seamester/cloud/cloud/memory_logs/file.log
# echo "***" >> /mnt/c/users/Adesoji/desktop/Altschool/second_seamester/cloud/cloud/memory_logs/file.log
# # echo "Memory log has been created"