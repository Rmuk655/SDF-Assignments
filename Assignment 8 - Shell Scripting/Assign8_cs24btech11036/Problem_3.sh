#!/bin/bash
if [ $# -eq 0 ]; then
    echo "No arguments provided!"
    exit 1
fi
if [ $# -eq 1 ]; then
    file="words.txt"
else
    file=$2
fi
if [ ! -f "$file" ]; then
    echo "File does not exist!" > /dev/null
    exit 1
fi
grep -o -i -E "\w*$1\w*" "$file" | sort -f | uniq | pr -t -4
exit 0