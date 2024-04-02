FROM ubuntu:20.04
WORKDIR /app

COPY ./container_scripts/* .

ARG NODE_VERSION
RUN ./select_node_version.sh "$NODE_VERSION" "ubuntu"

ARG NPM_MODULE
ARG ENABLE_CITGM
RUN ./run_package_module.sh "$NPM_MODULE" "$ENABLE_CITGM" 


