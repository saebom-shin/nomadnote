#!/usr/bin/env bash
set -euo pipefail

# Usage: ./build-docker.sh [image:tag]
IMAGE_NAME=${1:-calculator:latest}

echo "Building docker image ${IMAGE_NAME}..."
docker build -t "${IMAGE_NAME}" .
echo "Built ${IMAGE_NAME}"
