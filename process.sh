#!/bin/bash

# Start timer
start_time=$(date +%s)

# Initialize counters
processed=0
skipped=0

# Find all .tif files recursively in input folder
while IFS= read -r input_file; do
    # Get the relative path from input/
    relative_path="${input_file#input/}"
    
    # Get directory and filename
    dir=$(dirname "$relative_path")
    filename=$(basename "$relative_path" .tif)
    
    # Create output directory structure
    mkdir -p "output/$dir"
    
    # Set output file path
    output_file="output/$dir/${filename}.hocr"
    
    # Check if output file already exists
    if [ -f "$output_file" ]; then
        echo "Skipping (already exists): $output_file"
        ((skipped++))
        continue
    fi
    
    echo "Processing: $input_file -> $output_file"
    
    # Send to Tika and save output
    curl -s -T "$input_file" http://localhost:9998/tika \
        --header "Content-Type: image/tiff" \
        --header "X-Tika-OCRLanguage: deu" \
        -H "X-Tika-OCROutputType: hocr" \
        -o "$output_file"
    
    ((processed++))
done < <(find input -type f -name "*.tif")

# Calculate elapsed time
end_time=$(date +%s)
elapsed=$((end_time - start_time))
hours=$((elapsed / 3600))
minutes=$(((elapsed % 3600) / 60))
seconds=$((elapsed % 60))

# Format time output
if [ $hours -gt 0 ]; then
    time_str="${hours} hour(s) ${minutes} minute(s)"
elif [ $minutes -gt 0 ]; then
    time_str="${minutes} minute(s) ${seconds} second(s)"
else
    time_str="${seconds} second(s)"
fi

echo "Processing complete! Processed ${processed} files, skipped ${skipped} files. This took ${time_str}." 