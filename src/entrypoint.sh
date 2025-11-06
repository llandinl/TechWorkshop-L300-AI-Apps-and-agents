#!/bin/sh
set -e

# Ensure app directory exists (adjust if your app uses a different path)
mkdir -p /app

# If the ENV environment variable is set, write it into /app/.env
# This keeps the secret out of the image; the ENV value should be provided
# at container runtime (ACI/AKS/App Service, etc.) from your deployment.
if [ -n "${ENV}" ]; then
  echo "${ENV}" > /app/.env
  chmod 600 /app/.env
fi

# Execute the container CMD
exec "$@"