FROM ubuntu:20.04
WORKDIR /app

COPY ./docker_scripts/* .

ARG NODE_VERSION
RUN ./select_node_version.sh "$NODE_VERSION" "ubuntu"

ARG ENABLE_CITGM
RUN ./install_citgm.sh "$ENABLE_CITGM"

ARG NPM_MODULE

RUN ./run_package_module.sh "$NPM_MODULE" "$ENABLE_CITGM" 


