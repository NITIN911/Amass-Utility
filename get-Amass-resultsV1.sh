#!/bin/bash

# Check if the input file is provided as an argument
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 input_file"
    exit 1
fi

input_file="$1"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' not found."
    exit 1
fi

# Loop through each line in the file and execute the command
while IFS= read -r domain; do
    if [ -n "$domain" ]; then
        command="amass db -names -d $domain"
        echo "Executing: $command"
        $command
        echo "-------------------------------------"
    fi
done < "$input_file"

echo "Script completed."
