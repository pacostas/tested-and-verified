FROM ubuntu:22.04
WORKDIR /app

COPY ./docker_scripts/* .

RUN apt-get update && apt-get install -y curl
ARG NODE_VERSION
RUN ./select_node_version.sh "$NODE_VERSION" "ubuntu"

ARG NPM_MODULE
ARG ENABLE_CITGM
RUN ./run_package_module.sh "$NPM_MODULE" "$ENABLE_CITGM" 

