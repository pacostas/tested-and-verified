FROM fedora:39

RUN dnf -y module enable nodejs:20  && dnf -y install git nodejs nodejs-nodemon npm && dnf clean all

RUN node -v

RUN npm install -g citgm

RUN git clone https://github.com/expressjs/express.git

RUN cd express

# RUN npm i

# RUN npm run test

# RUN citgm express@4.18.2