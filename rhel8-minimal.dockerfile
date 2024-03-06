# FROM registry.access.redhat.com/ubi8/nodejs-20
FROM registry.access.redhat.com/ubi8/nodejs-20-minimal

# Run with docker build -t node-rhel8-minimal . -f rhel8-minimal.dockerfile


# USER root

# RUN mkdir /opt/app-root/src/.npm-global

# RUN mkdir /opt/app-root/src/.npm-global/lib

# RUN chown -R 1000:0 /opt/app-root/src/.npm


# RUN npm config set prefix '~/.npm-global'

# RUN export PATH=~/.npm-global/bin:$PATH


RUN dnf -y install git


# RUN git clone https://github.com/fastify/fastify.git && \
# cd fastify && \
# npm i && \
# npm run test

# RUN npm install -g citgm && citgm express

RUN git clone https://github.com/nodeshift/opossum && \
cd opossum && \
npm install && \
npm run test

# RUN npm install -g citgm && citgm opossum