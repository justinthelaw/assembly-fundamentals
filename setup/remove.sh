#!/bin/bash

# Check if file path is provided as an argument
if [[ -z "$1" ]]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

# Read file line by line and remove packages
while read -r package; do
  sudo apt remove -y "$package"
done < "$1"
