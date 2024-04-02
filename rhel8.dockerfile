FROM registry.access.redhat.com/ubi8/s2i-core:1

WORKDIR /app

COPY ./docker_scripts/* .

ARG NODE_VERSION
RUN ./select_node_version.sh "$NODE_VERSION" "rhel"

ARG NPM_MODULE
ARG ENABLE_CITGM
RUN ./run_package_module.sh "$NPM_MODULE" "$ENABLE_CITGM"
