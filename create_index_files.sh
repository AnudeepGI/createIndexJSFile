#!/bin/bash

# Directory where the folders are located
base_directory="/path/to/your/directory"

# Change to the base directory
cd "$base_directory" || exit

# Loop through each item in the directory
for folder in */; do
    # Check if the item is a directory
    if [ -d "$folder" ]; then
        # Remove the trailing slash from the folder name
        folder_name=${folder%/}

        # Create or overwrite the index.js file in the folder
        echo "export { default } from './$folder_name';" > "$folder_name/index.js"
    fi
done

echo "Index files created."
