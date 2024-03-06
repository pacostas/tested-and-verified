FROM registry.access.redhat.com/ubi9/s2i-core:1
WORKDIR /app

COPY ./docker_scripts/* .

ARG NODE_VERSION

RUN ./select_node_version.sh "$NODE_VERSION"

ARG ENABLE_CITGM
ARG NPM_MODULE

RUN ./run_package_module.sh "$NPM_MODULE" "$ENABLE_CITGM" 

