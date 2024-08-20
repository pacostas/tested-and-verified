#!/bin/bash

NODE_VERSION=$1
OS_NAME=$2

if [ "$OS_NAME" = "ubuntu" ]; then
    curl -fsSL "https://deb.nodesource.com/setup_${NODE_VERSION}.x" | bash - &&
        apt-get install -y nodejs git jq
elif [ "$OS_NAME" = "rhel" ]; then
    yum -y module enable "nodejs:${NODE_VERSION}" &&
        yum -y install git nodejs nodejs-nodemon npm jq && yum clean all
elif [ "$OS_NAME" = "fedora" ]; then
    dnf -y install "nodejs${NODE_VERSION}" && dnf -y install git nodejs nodejs-nodemon npm jq && dnf clean all 
    alternatives --install /usr/bin/node node "/usr/bin/node-${NODE_VERSION}" 1
fi
