#!/bin/bash

pushd ./npm_packages
git clone https://github.com/expressjs/express.git
git clone https://github.com/siimon/prom-client
git clone https://github.com/nodeshift/opossum
git clone https://github.com/nodeshift/kube-service-bindings
git clone https://github.com/nodeshift/faas-js-runtime
git clone https://www.npmjs.com/package/cloudevents
git clone https://github.com/fastify/fastify.git
popd