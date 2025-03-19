#!/bin/bash

# Check if a directory was provided
if [ $# -eq 1 ]; then
    # If directory provided, change to that directory
    cd "$1" || { echo "Error: Could not change to directory $1"; exit 1; }
fi

# Print current directory
echo "Converting files in: $(pwd)"
echo ""

# Counter for converted files
count=0

# Loop through all files in current directory
for file in *; do
    # Skip if it's not a file or doesn't contain underscore
    if [ ! -f "$file" ] || [[ "$file" != *_* ]]; then
        continue
    fi

    # Create new filename replacing underscores with hyphens
    new_file="${file//_/-}"
    
    # Skip if the file already exists
    if [ -e "$new_file" ] && [ "$file" != "$new_file" ]; then
        echo "⚠️  Skipping: $file → $new_file (destination already exists)"
        continue
    fi

    # Rename the file
    mv "$file" "$new_file"
    
    # Increment counter and report
    ((count++))
    echo "✅ Converted: $file → $new_file"
done

# Summary
if [ $count -eq 0 ]; then
    echo "No files were converted. No snake_case files found."
else
    echo ""
    echo "🎉 Conversion complete! $count files were converted from snake_case to kebab-case."
fi
