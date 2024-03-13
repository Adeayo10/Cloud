#!/bin/bash
# Check if a file exists
if [ -f "myfile.txt" ]; then
    echo "myfile.txt exists"
else
    echo "myfile.txt does not exist"
fi

# Check if a directory exists
if [ -d "mydir" ]; then
    echo "mydir exists"
else
    echo "mydir does not exist"
fi