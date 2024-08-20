ARG NODE_VERSION
FROM registry.access.redhat.com/ubi9/nodejs-${NODE_VERSION}-minimal

WORKDIR /app

COPY ../container_scripts/* .
COPY ../supported_modules.json .

ARG NPM_MODULE
ARG ENABLE_CITGM
RUN ./install_test_module.sh "$NPM_MODULE" "$ENABLE_CITGM"
