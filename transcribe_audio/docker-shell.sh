#!/bin/bash

# exit immediately if a command exits with a non-zero status
set -e

# Define some environment variables
export IMAGE_NAME="mega-pipeline-transcribe-audio"
export BASE_DIR=$(pwd)
export SECRETS_DIR=$(pwd)/../../secrets/
export GOOGLE_APPLICATION_CREDENTIALS=/secrets/mega-pipeline.json


echo "Building development image locally..."
# Build the image based on the Dockerfile
docker build -t $IMAGE_NAME -f Dockerfile .

echo "Run Docker container..."
# Run Container
docker run --rm --name $IMAGE_NAME -ti \
-v "$BASE_DIR":/app \
-v "$SECRETS_DIR":/secrets \
-e GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_APPLICATION_CREDENTIALS \
$IMAGE_NAME
