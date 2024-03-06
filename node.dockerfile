FROM node:20

# Run it with 
# docker build -t node-ubuntu . -f node.dockerfile

user root

WORKDIR /app

# RUN dnf module install nodejs:18

RUN git clone https://github.com/nodeshift/opossum && \
cd opossum && \
npm install && \
npm run test

# RUN git clone https://github.com/fastify/fastify.git && \
#     cd fastify && \
#     npm install && \
#     npm run test



# RUN npm install -g citgm &&  citgm fastify