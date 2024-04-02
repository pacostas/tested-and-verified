ARG NODE_VERSION
FROM registry.access.redhat.com/ubi8/nodejs-${NODE_VERSION}-minimal


WORKDIR /app

COPY ./container_scripts/* .

ARG NPM_MODULE
ARG ENABLE_CITGM
RUN ./run_package_module.sh "$NPM_MODULE" "$ENABLE_CITGM"
