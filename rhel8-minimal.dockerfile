ARG NODE_VERSION
FROM registry.access.redhat.com/ubi8/nodejs-${NODE_VERSION}-minimal

WORKDIR /app

COPY ./docker_scripts/* .

ARG ENABLE_CITGM
RUN ./install_citgm.sh "$ENABLE_CITGM"

ARG NPM_MODULE
RUN ./run_package_module.sh "$NPM_MODULE" "$ENABLE_CITGM"
