#!/bin/bash
echo "Enter the no of files to be generated"
read no_of_files
create_files() {
    for i in $(seq 1 "$1")
    do
        echo "Enter the size of file in bytes"
        read size
        head -c "$((size))" </dev/urandom > "random_file$i.txt"
    done
}
create_files "$no_of_files"
exit 0