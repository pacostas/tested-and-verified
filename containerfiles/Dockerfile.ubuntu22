FROM ubuntu:22.04
WORKDIR /app

COPY ../container_scripts/* .
COPY ../supported_modules.json .

RUN apt-get update && apt-get install -y curl
ARG NODE_VERSION
RUN ./install_node_engine.sh "$NODE_VERSION" "ubuntu"

ARG NPM_MODULE
ARG ENABLE_CITGM
RUN ./install_test_module.sh "$NPM_MODULE" "$ENABLE_CITGM"
