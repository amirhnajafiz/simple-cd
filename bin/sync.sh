#!/bin/bash

# Build the manifests path
manifests="$SCD_REPO_PATH/$SCD_REPO_MANIFESTS/"

# This will apply kubectl apply -f on all objects
response=$(kubectl apply -f "$manifests" \
    --namespace "$SCD_KUBE_NS" \
    --server "$SCD_KUBE_API" \
    --token "$SCD_KUBE_TOKEN" \
    2>&1 # capture both stdout and stderr
)

# Export the response data info log file
echo "$response" >> "$SCD_LOG"
