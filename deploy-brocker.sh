#!/usr/bin/env sh
set -eu

INIT() {
cd ./environment/rabbit
export COMPOSE_PROJECT_NAME=cb-msc
docker compose up --build
}

INIT
