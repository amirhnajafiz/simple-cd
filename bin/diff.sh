#!/bin/bash

# Enter the repository directory.
cd "$SCD_REPO_PATH"

# Fetch the latest updates from the remote (without merging or pulling).
# If the fetch command failes, it will return an error.
git fetch || exit 1

# Check if the local branch is behind the remote branch.
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse @{u})

if [ "$LOCAL" != "$REMOTE" ]; then   
    # Now pull the changes since we detected updates.
    # If an error happens it will exit with 1.
    git pull || exit 0
fi

# When nothing is changed, it returns 2 to the caller (main.sh)
exit 2
