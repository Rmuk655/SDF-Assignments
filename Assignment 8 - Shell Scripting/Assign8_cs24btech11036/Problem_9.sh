#!/bin/bash
if [ "$#" -lt 2 ]; then
    echo "Usage: combine outputfilename [inputfilename ...]" >&2
    exit 1
fi
output_file="$1"
shift
if [ -e "$output_file" ]; then
    echo "Error: Output file should not exist" >&2
    exit 1
fi
for file in "$@"; do
    cat "$file" 2>>"$output_file" >>"$output_file"
done
exit 0