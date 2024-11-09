#!/bin/bash

# Ensure Quarto is installed
if ! command -v quarto &> /dev/null
then
    echo "Quarto could not be found. Please install Quarto to proceed."
    exit
fi

# Directory containing .qmd files (current directory by default)
INPUT_DIR="${1:-.}"

# Output directory for PDFs
OUTPUT_DIR="${2:-./output}"

# Log file
LOG_FILE="${3:-./render_log.txt}"

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Clear or create the log file
echo "Render log for $(date)" > "$LOG_FILE"
echo "Input directory: $INPUT_DIR" >> "$LOG_FILE"
echo "Output directory: $OUTPUT_DIR" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# Loop through each .qmd file in the input directory
for qmd_file in "$INPUT_DIR"/*.qmd; do
    if [ -f "$qmd_file" ]; then
        # Render the .qmd file to a PDF (in the same directory as the .qmd file)
        echo "Rendering $qmd_file..."
        echo "Rendering $qmd_file..." >> "$LOG_FILE"
        
        # Render the file without specifying an output path (Quarto handles it)
        quarto render "$qmd_file" --to pdf
        
        # Move the rendered PDF to the output directory
        pdf_file="${qmd_file%.qmd}.pdf"
        if [ -f "$pdf_file" ]; then
            mv "$pdf_file" "$OUTPUT_DIR/"
            echo "Successfully rendered and moved to $OUTPUT_DIR"
            echo "SUCCESS: Rendered $qmd_file and moved to $OUTPUT_DIR" >> "$LOG_FILE"
        else
            echo "Failed to render $qmd_file"
            echo "FAIL: Failed to render $qmd_file" >> "$LOG_FILE"
        fi
    else
        echo "No .qmd files found in $INPUT_DIR"
        echo "No .qmd files found in $INPUT_DIR" >> "$LOG_FILE"
    fi
done

echo "Rendering process complete. Check the log at $LOG_FILE."
