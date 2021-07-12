#!/usr/bin/env sh
set -eu

INIT() {
cd ./environment/microservices
export COMPOSE_PROJECT_NAME=cb-msc
docker compose up --build
}

INIT
