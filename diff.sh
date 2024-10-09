#!/bin/bash

# Fetch the latest updates from the remote (without merging or pulling)
git fetch

# Check if the local branch is behind the remote branch
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse @{u})

if [ "$LOCAL" != "$REMOTE" ]; then
    echo "New changes detected in the repository!"
    
    # Now pull the changes since we detected updates
    git pull
else
    echo "No new changes."
fi
