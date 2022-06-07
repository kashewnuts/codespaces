#!/usr/bin/env bash
set -ex

# to use docker-compose command
cp -n .env.sample .env || true

# initial setup docker components
export BUILDKIT_PROGRESS=plain
docker-compose up --build --no-start
docker-compose stop  # prebuildのため落としておきたい

# install python packages for local development
pipx install poetry
(cd backend && poetry install)

# install node.js packages for local development
(cd frontend && npm install)
