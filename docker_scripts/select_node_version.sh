#!/bin/bash

NODE_VERSION=$1

if [ "$NODE_VERSION" = "20" ]; then
    yum -y module enable nodejs:20 &&
        yum -y install git nodejs nodejs-nodemon npm && yum clean all
elif [ "$NODE_VERSION" = "18" ]; then
    yum -y module enable nodejs:18 &&
        yum -y install git nodejs nodejs-nodemon npm && yum clean all
elif [ "$NODE_VERSION" = "16" ]; then
    yum -y module enable nodejs:16 &&
        yum -y install git nodejs nodejs-nodemon npm && yum clean all
fi
