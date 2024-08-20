FROM registry.access.redhat.com/ubi8/s2i-core:1

WORKDIR /app

COPY ../container_scripts/* .

ARG NODE_VERSION
RUN ./install_node_engine.sh "$NODE_VERSION" "rhel"

ARG NPM_MODULE
ARG ENABLE_CITGM
RUN ./install_test_module.sh "$NPM_MODULE" "$ENABLE_CITGM"
