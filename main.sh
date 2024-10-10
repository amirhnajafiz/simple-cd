#!/bin/bash

# Source the `.env` file as environment variables
source config/.env

# Script variables
diff="./bin/diff.sh"
sync="./bin/sync.sh"

# The main function of simple-cd
main() {
    # First it runs the diff script.
    # Export its logs into log file.
    $diff >> "$SCD_LOG"

    # Capture the exit code of diff script
    status=$?
    
    # Check the exit code
    if [ $status -eq 0 ]; then
        # Run the sync script.
        $sync
    elif [ $tatus -eq 1 ]; then
        echo "failed to run diff script!"
    fi
}

# The main loop of simple-cd
echo "Simple-CD running ..."
while true; do
    # Wait for an interval, then run main function
    sleep $SCD_INTERVAL
    main
done
