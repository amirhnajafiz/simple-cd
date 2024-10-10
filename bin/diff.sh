#!/bin/bash

# Execute sources.
source ../pkg/status_codes.sh

# Enter the repository directory.
cd "$SCD_REPO_PATH"

# Fetch the latest updates from the remote (without merging or pulling).
# If the fetch command failes, it will return an error.
git fetch || exit $EXIT_FAILED

# Check if the local branch is behind the remote branch.
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse @{u})

if [ "$LOCAL" != "$REMOTE" ]; then
    # Now pull the changes since we detected updates.
    # If succesed, it will exit with success code.
    git pull && exit $EXIT_SUCCESS
fi

# When nothing is changed, it returns a none code to the caller (main.sh).
exit $EXIT_NONE
