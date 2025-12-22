#!/bin/bash
# Code here
if [ $# -eq 0 ]; then
    echo "No arguments provided!"
    exit 1
fi
if [ ! -f "phonebook.txt" ]; then
    touch phonebook.txt
fi  
if [ "$1" == "new" ]; then
    #When appending names, enclose the name in double quotes.
    echo "$2 $3" >> phonebook.txt
elif [ "$1" == "list" ]; then
    if [ -s "phonebook.txt" ]; then
        cat phonebook.txt
    else
        echo "phonebook is empty"  
    fi
elif [ "$1" == "remove" ]; then
    sed -i "/$2/d" phonebook.txt
elif [ "$1" == "clear" ]; then
    > phonebook.txt
elif [ "$1" == "lookup" ]; then
    grep -i "$2" phonebook.txt
fi
# End of code