#!/bin/bash

# Source the `.env` file as environment variables, and status codes.
source config/.env
source pkg/status_codes.sh

# Script variables.
diff="./bin/diff.sh"
sync="./bin/sync.sh"

# The main function of simple-cd
main() {
    # On every main run create a new log entry by printing the date.
    date >> "$SCD_LOG"

    # First it runs the diff script and export its logs into the log file.
    $diff >> "$SCD_LOG"

    # Capture the exit code of diff script
    status=$?
    
    # Check the exit code.
    if [ $status -eq $EXIT_SUCCESS ]; then
        # Run the sync script.
        echo "syncing the application." >> "$SCD_LOG"
        $sync >> "$SCD_LOG"
    elif [ $tatus -eq $EXIT_FAILED ]; then
        echo "failed to run diff script!" >> "$SCD_LOG"
    fi
}


echo "Simple-CD running ..."
# The main loop of simple-cd.
while true; do
    # Wait for an interval, then run main function.
    sleep $SCD_INTERVAL
    main
done
