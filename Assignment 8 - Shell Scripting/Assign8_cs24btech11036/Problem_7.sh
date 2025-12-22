#!/bin/bash
echo "Enter file name:"
read file_name
echo "Enter column number from where you want to extract data:"
read col
IFS=$'\n' read -r -d '' -a values < <(awk -F ',' -v col="$col" 'NR>1 {print $col}' "$file_name" | head -n 3 && printf '\0')
v0=${values[0]}
v1=${values[1]}
v2=${values[2]}
if (( 2 * v1 == v0 + v2 )); then
    chmod u+w input.csv
    echo "Enter the number of rows you want to add:"
    read no_of_rows
    d=$((v2 - v1))
    num_columns=$(head -n 1 "$file_name" | awk -F ',' '{print NF}')
    for ((i = 1; i <= no_of_rows; i++)); do
        v2=$((v2 + d))
        new_row=""
        for ((j = 1; j <= num_columns; j++)); do
            if (( j == col )); then
                new_row+="$v2"
            else
                if [[ -z "$new_row" ]]; then
                    new_row+=","
                else
                    new_row+=","
                fi
            fi
        done
        echo "$new_row" >> "$file_name"
    done
    echo "Data appended successfully."
else
    echo "Numbers are not in AP!"
    exit 255
fi