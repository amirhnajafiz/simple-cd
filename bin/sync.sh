#!/bin/bash

# Build the manifests path.
manifests="$SCD_REPO_PATH/$SCD_REPO_MANIFESTS/"

# This will apply kubectl apply -f on all objects.
kubectl apply -f "$manifests" \
    --namespace "$SCD_KUBE_NS" \
    --server "$SCD_KUBE_API" \
    --token "$SCD_KUBE_TOKEN"
