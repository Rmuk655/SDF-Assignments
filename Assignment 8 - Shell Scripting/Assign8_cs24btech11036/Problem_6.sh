#!/bin/bash
echo "Choose an operation:"
echo "1. Concatenate"
echo "2. Sum"
echo "3. Product"
echo "4. Division"
echo "5. Exit"
echo "Enter your option:"
read op
while [ "$op" -ne 5 ]; do
  if [ "$op" -eq 1 ]; then
    echo "Enter column numbers to concatenate (comma-separated, e.g., 2,3):"
    read columns
    IFS=',' read -r col1 col2 <<< "$columns"
    tr -d '\r' < modified.csv > temp.csv
    awk -F',' -v c1="$col1" -v c2="$col2" 'BEGIN {OFS=","} 
        NR==1 {print $0, "Concat_c" c1 "_c" c2; next} 
        {gsub(/\r|\n/, "", $c1); gsub(/\r|\n/, "", $c2); print $0, $c1 " " $c2}' temp.csv > modified.csv
  elif [ "$op" -eq 2 ]; then
    echo "Enter column numbers to add (comma-separated, e.g., 4,5):"
    read columns
    IFS=',' read -r col1 col2 <<< "$columns"
    tr -d '\r' < modified.csv > temp.csv
    awk -F',' -v c1="$col1" -v c2="$col2" 'BEGIN {OFS=","} 
        NR==1 {print $0, "Sum_c" c1 "_c" c2; next} 
        {gsub(/\r|\n/, "", $c1); gsub(/\r|\n/, "", $c2); print $0, ($c1 + $c2)}' temp.csv > modified.csv
  elif [ "$op" -eq 3 ]; then
    echo "Enter column numbers to multiply (comma-separated, e.g., 4,5):"
    read columns
    IFS=',' read -r col1 col2 <<< "$columns"
    tr -d '\r' < modified.csv > temp.csv
    awk -F',' -v c1="$col1" -v c2="$col2" 'BEGIN {OFS=","} 
        NR==1 {print $0, "Product_c" c1 "_c" c2; next} 
        {gsub(/\r|\n/, "", $c1); gsub(/\r|\n/, "", $c2); print $0, ($c1 * $c2)}' temp.csv > modified.csv
  elif [ "$op" -eq 4 ]; then
    echo "Enter column numbers to divide (comma-separated, e.g., 4,5):"
    read columns
    IFS=',' read -r col1 col2 <<< "$columns"
    tr -d '\r' < modified.csv > temp.csv
    awk -F',' -v c1="$col1" -v c2="$col2" 'BEGIN {OFS=","} 
        NR==1 {print $0, "Division_c" c1 "_c" c2; next} 
        {gsub(/\r|\n/, "", $c1); gsub(/\r|\n/, "", $c2); 
        if ($c2 != 0) print $0, ($c1 / $c2); else print $0, "Error: Division by zero"}' temp.csv > modified.csv
  else
    echo "Invalid option! Please enter a number between 1 and 5."
  fi
  echo "Choose an operation:"
  echo "1. Concatenate"
  echo "2. Sum"
  echo "3. Product"
  echo "4. Division"
  echo "5. Exit"
  echo "Enter your option:"
  read op
done
echo "Exiting program."