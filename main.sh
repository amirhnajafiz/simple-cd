#!/bin/bash

# Import required modules.
source lib/status_codes.sh
source lib/validator.sh

# Run the validate function to check dependencies.
if validate; then
    printf "all directories and files are valid.\n"
else
    printf "some directories or files are missing."
    exit 1 # Exit with an error status.
fi

# Script variables.
diff="./bin/diff.sh"
sync="./bin/sync.sh"

# The main function of simple-cd
main() {
    # On every main run create a new log entry by printing the date.
    date >>"$SCD_LOG"

    # First it runs the diff script and export its logs into the log file.
    $diff >>"$SCD_LOG"

    # Capture the exit code of diff script
    status=$?

    # Check the exit code.
    if [ $status -eq $EXIT_SUCCESS ]; then
        echo "syncing the application." >>"$SCD_LOG"

        # Run the sync script to update resources.
        $sync >>"$SCD_LOG"

    elif [ $status -eq $EXIT_FAILED ]; then
        echo "failed to run diff script!" >>"$SCD_LOG"
    fi
}

# Displaying some configs and messages before starting the loop.
printf "loop interval $SCD_INTERVAL seconds.\nSimple-CD running ...\n"

# The main loop of simple-cd.
while true; do
    # Wait for an interval, then run main function.
    sleep $SCD_INTERVAL
    # Running main function.
    main
done
