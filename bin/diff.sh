#!/bin/bash

# Enter the repo directory, if not exists it will return 1 as an error.
cd "$SCD_REPO_PATH" || exit 1

# Fetch the latest updates from the remote (without merging or pulling).
# If the fetch command failes, it will return an error.
git fetch || exit 1

# Check if the local branch is behind the remote branch.
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse @{u})

if [ "$LOCAL" != "$REMOTE" ]; then
    echo "new changes detected in the repository!"
    
    # Now pull the changes since we detected updates.
    # If an error happens it will exit with 1.
    git pull || exit 1

    # Exit with status 0 to provide a success message
    # to the caller (main.sh).
    exit 0
else
    echo "no new changes."
    # Otherwise, return 2 to caller (main.sh).
    # It means that no new changes received.
    exit 2
fi
