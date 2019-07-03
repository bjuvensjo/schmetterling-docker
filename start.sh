#!/usr/bin/env bash
# This is an example of a start file. Copy to your start volume and modify as required.

# Exit the script as soon as one of the commands fail
set -e

# Configure git
git config --global user.name "$USER_NAME" && \
    git config --global user.email "$USERNAME@schmetterling.org" && \
    git config --global credential.helper store && \
    echo "http://$BITBUCKET_USERNAME:$BITBUCKET_PASSWORD@$BITBUCKET_HOST" > "$HOME/.git-credentials"

# Start pipeline
cd $PIPELINE_DIR
python3 $PIPELINE_NAME > /dev/null 2>&1

