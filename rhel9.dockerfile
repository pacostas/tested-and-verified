FROM registry.access.redhat.com/ubi9/s2i-core:1

# Run with 
# docker build -t node-rhel8 . -f rhel8.dockerfile

ARG NODE_VERSION

RUN if [ "$NODE_VERSION" = "20" ] ; then \
    yum -y module enable nodejs:20  && \
    yum -y install git nodejs nodejs-nodemon npm && yum clean all ; \
    elif [ "$NODE_VERSION" = "18" ] ; then \
    yum -y module enable nodejs:18  && \
    yum -y install git nodejs nodejs-nodemon npm && yum clean all ; \
    elif [ "$NODE_VERSION" = "14" ] ; then \
    yum -y module enable nodejs:14  && \
    yum -y install git nodejs nodejs-nodemon npm && yum clean all ; \
    elif [ "$NODE_VERSION" = "16" ] ; then \
    yum -y module enable nodejs:16  && \
    yum -y install git nodejs nodejs-nodemon npm && yum clean all ; \
    fi

ARG ENABLE_CITGM

ARG NPM_MODULE

RUN if [ "$NPM_MODULE" = "fastify" ] ; then \
        if [ "$ENABLE_CITGM" = "true" ] ; then \
        npm install -g citgm && citgm fastify ; \
        else git clone https://github.com/fastify/fastify.git && cd fastify && npm i && npm run test ; fi \
    elif [ "$NPM_MODULE" = "express" ] ; then \
        if [ "$ENABLE_CITGM" = "true" ] ; then \
        npm install -g citgm && citgm express ; \
        else git clone https://github.com/expressjs/express.git && cd express && npm i && npm run test ; fi \
    elif [ "$NPM_MODULE" = "prom" ] ; then \
        if [ "$ENABLE_CITGM" = "true" ] ; then \
        npm install -g citgm && citgm prom-client ; \
        else git clone https://github.com/siimon/prom-client && cd prom-client && npm i && npm run test ; fi \
    elif [ "$NPM_MODULE" = "opossum" ] ; then \
        if [ "$ENABLE_CITGM" = "true" ] ; then \
        npm install -g citgm && citgm opossum; \
        else git clone https://github.com/nodeshift/opossum && cd opossum && npm i && npm run test ; fi \
    fi



