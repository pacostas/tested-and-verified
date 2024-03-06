FROM registry.access.redhat.com/ubi8/nodejs-20-minimal

WORKDIR /app

COPY ./docker_scripts/* .

ARG ENABLE_CITGM
ARG NPM_MODULE

RUN ./run_package_module.sh "$NPM_MODULE" "$ENABLE_CITGM"
