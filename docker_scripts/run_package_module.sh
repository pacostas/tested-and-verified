#! /bin/bash

NPM_MODULE=$1
ENABLE_CITGM=$2

if [ "$NPM_MODULE" = "fastify" ]; then
    if [ "$ENABLE_CITGM" = "true" ]; then
        citgm fastify
    else git clone https://github.com/fastify/fastify.git && cd fastify && npm i && npm run test; fi
elif [ "$NPM_MODULE" = "express" ]; then
    if [ "$ENABLE_CITGM" = "true" ]; then
        citgm express
    else git clone https://github.com/expressjs/express.git && cd express && npm i && npm run test; fi
elif [ "$NPM_MODULE" = "prom" ]; then
    if [ "$ENABLE_CITGM" = "true" ]; then
        citgm prom-client
    else git clone https://github.com/siimon/prom-client && cd prom-client && npm i && npm run test; fi
elif [ "$NPM_MODULE" = "kube" ]; then
    if [ "$ENABLE_CITGM" = "true" ]; then
        citgm kube-service-bindings
    else
        git clone https://github.com/nodeshift/kube-service-bindings && cd kube-service-bindings && npm i && npm run test
    fi
elif [ "$NPM_MODULE" = "faas" ]; then
    if [ "$ENABLE_CITGM" = "true" ]; then
        citgm faas-js-runtime
    else git clone https://github.com/nodeshift/faas-js-runtime && cd faas-js-runtime && npm i && npm run test; fi
elif [ "$NPM_MODULE" = "cloudevents" ]; then
    if [ "$ENABLE_CITGM" = "true" ]; then
        citgm cloudevents
    else git clone https://github.com/cloudevents/sdk-javascript && cd sdk-javascript && npm i && npm run test; fi
elif [ "$NPM_MODULE" = "opossum" ]; then
    if [ "$ENABLE_CITGM" = "true" ]; then
        citgm opossum
    else git clone https://github.com/nodeshift/opossum && cd opossum && npm i && npm run test; fi
fi
