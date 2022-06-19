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
# XXX: poetry installするとDocker環境の.venvと干渉するため、ローカル環境では仮想環境でなく直接インストールしている。
(cd backend && poetry export -f requirements.txt --output requirements.txt --without-hashes --dev && pip install -r requirements.txt --no-warn-script-location && rm -rf requirements.txt)

# install node.js packages for local development
(cd frontend && npm install)
