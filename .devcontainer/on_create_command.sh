#!/usr/bin/env bash
set -ex

# to use docker-compose command
cp -n .env.tmp .env || true

# initial setup docker components
export BUILDKIT_PROGRESS=plain
# docker login --username $DOCKER_USERNAME -p $DOCKER_LOGIN_PASS
docker-compose up --build --no-start
docker-compose stop  # prebuildのため落としておきたい

# install python packages for local development
(cd backend && pip install -r requirements.txt --no-warn-script-location)

# install node.js packages for local development
(cd frontend && npm install)
