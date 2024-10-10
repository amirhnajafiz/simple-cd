#!/bin/bash

# Source the `.env` file as environment variables
source config/.env

# Script variables
diff="./bin/diff.sh"
sync="./bin/sync.sh"

# The main function of simple-cd
main() {
    # First it runs the diff script.
    $diff
}
