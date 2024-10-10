#!/bin/bash

# Import needed modules.
source status_codes.sh

# Local variables
files=("$SCD_LOG" "config/.env")
directories=("config" "$SCD_REPO_PATH/" "$SCD_REPO_PATH/$SCD_REPO_MANIFESTS/")

# Check dirs function checks the existance of needed directories.
check_dirs() {
    # Loop through each directory in the array.
    for dir in "${directories[@]}"; do
        if [ ! -d "$dir" ]; then
            return $EXIT_FAILED
        fi
    done

    return $EXIT_SUCCESS
}

# Check files function checks the existance of needed files.
check_files() {
    # Loop through each file in the array.
    for file in "${files[@]}"; do
        if [ ! -f "$file" ]; then
            return $EXIT_FAILED
        fi
    done

    return $EXIT_SUCCESS
}

# Validator function is used to run check functions.
validate() {
    check_dirs && check_files
    return $? # Return the result of the last function call
}
