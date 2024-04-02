ARG NODE_VERSION
FROM registry.access.redhat.com/ubi9/nodejs-${NODE_VERSION}-minimal

WORKDIR /app

COPY ./docker_scripts/* .

ARG NPM_MODULE
ARG ENABLE_CITGM
RUN ./run_package_module.sh "$NPM_MODULE" "$ENABLE_CITGM"
