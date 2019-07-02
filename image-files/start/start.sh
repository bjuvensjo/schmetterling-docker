#!/usr/bin/env bash

# Exit the script as soon as one of the commands fail
set -e

# Configure git
git config --global user.name "$USER_NAME" && \
    git config --global user.email "$USERNAME@schmetterling.org" 

# Start pipeline
cd $PIPELINE_DIR
python3 $PIPELINE_NAME > $WORK_DIR/schmetterling.log 2>&1

