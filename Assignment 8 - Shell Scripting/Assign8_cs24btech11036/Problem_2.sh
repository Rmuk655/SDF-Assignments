#!/bin/bash
read file_name
read new_name
if [ ! -f "$file_name" ]; then
       echo "File does not exist! Please enter a valid file name!"
else
        if [ -s $new_name ]; then
                new_file_name=$(date "+%Y-%m-%d").${file_name##*.}
                mv $file_name $new_file_name
        else
                new_file_name=$new_name
                mv $file_name $new_file_name
        fi
fi
echo "Original file name is: $file_name"
echo "New file name is $new_file_name"