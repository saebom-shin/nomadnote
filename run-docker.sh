#!/usr/bin/env bash
set -euo pipefail

# Usage: ./run-docker.sh [image:tag] [container_name]
IMAGE_NAME=${1:-calculator:latest}
CONTAINER_NAME=${2:-calculator-container}

echo "Stopping existing container (if any)..."
docker rm -f "${CONTAINER_NAME}" >/dev/null 2>&1 || true

echo "Running container ${CONTAINER_NAME} from image ${IMAGE_NAME}..."
docker run -d --name "${CONTAINER_NAME}" -p 8080:8080 "${IMAGE_NAME}"
echo "Application started at http://localhost:8080/"

# To stop and remove:
# docker rm -f "${CONTAINER_NAME}"
# To remove image:
# docker rmi "${IMAGE_NAME}"
