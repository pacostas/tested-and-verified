#!/bin/bash

S2I_DIRECTORY_ABS_PATH=$1


# Node 18
sed -i '0,/^FROM ubi8\/s2i-core:1/{s/^FROM ubi8\/s2i-core:1/FROM registry.access.redhat.com\/ubi8\/s2i-core:1/}' \
$S2I_DIRECTORY_ABS_PATH/18/Dockerfile.rhel8
sed -i '0,/^FROM ubi8\/ubi-minimal:latest/{s/^FROM ubi8\/ubi-minimal:latest/FROM registry.access.redhat.com\/ubi8\/ubi-minimal:latest/}' \
$S2I_DIRECTORY_ABS_PATH/18-minimal/Dockerfile.rhel8
sed -i '0,/^FROM ubi9\/s2i-core:1/{s/^FROM ubi9\/s2i-core:1/FROM registry.access.redhat.com\/ubi9\/s2i-core:1/}' \
$S2I_DIRECTORY_ABS_PATH/18/Dockerfile.rhel9
sed -i '0,/^FROM ubi9\/ubi-minimal/{s/^FROM ubi9\/ubi-minimal/FROM registry.access.redhat.com\/ubi9\/ubi-minimal/}' \
$S2I_DIRECTORY_ABS_PATH/18-minimal/Dockerfile.rhel9

# Node 20
sed -i '0,/^FROM ubi8\/s2i-core:1/{s/^FROM ubi8\/s2i-core:1/FROM registry.access.redhat.com\/ubi8\/s2i-core:1/}' \
$S2I_DIRECTORY_ABS_PATH/20/Dockerfile.rhel8
sed -i '0,/^FROM ubi8\/ubi-minimal:latest/{s/^FROM ubi8\/ubi-minimal:latest/FROM registry.access.redhat.com\/ubi8\/ubi-minimal:latest/}' \
$S2I_DIRECTORY_ABS_PATH/20-minimal/Dockerfile.rhel8
sed -i '0,/^FROM ubi9\/s2i-core:1/{s/^FROM ubi9\/s2i-core:1/FROM registry.access.redhat.com\/ubi9\/s2i-core:1/}' \
$S2I_DIRECTORY_ABS_PATH/20/Dockerfile.rhel9
sed -i '0,/^FROM ubi9\/ubi-minimal/{s/^FROM ubi9\/ubi-minimal/FROM registry.access.redhat.com\/ubi9\/ubi-minimal/}' \
$S2I_DIRECTORY_ABS_PATH/20-minimal/Dockerfile.rhel9

# Node 22
sed -i '0,/^FROM ubi8\/s2i-core:1/{s/^FROM ubi8\/s2i-core:1/FROM registry.access.redhat.com\/ubi8\/s2i-core:1/}' \
$S2I_DIRECTORY_ABS_PATH/22/Dockerfile.rhel8
sed -i '0,/^FROM ubi8\/ubi-minimal:latest/{s/^FROM ubi8\/ubi-minimal:latest/FROM registry.access.redhat.com\/ubi8\/ubi-minimal:latest/}' \
$S2I_DIRECTORY_ABS_PATH/22-minimal/Dockerfile.rhel8
sed -i '0,/^FROM ubi9\/s2i-core:1/{s/^FROM ubi9\/s2i-core:1/FROM registry.access.redhat.com\/ubi9\/s2i-core:1/}' \
$S2I_DIRECTORY_ABS_PATH/22/Dockerfile.rhel9
sed -i '0,/^FROM ubi9\/ubi-minimal/{s/^FROM ubi9\/ubi-minimal/FROM registry.access.redhat.com\/ubi9\/ubi-minimal/}' \
$S2I_DIRECTORY_ABS_PATH/22-minimal/Dockerfile.rhel9
sed -i '0,/^FROM ubi10\/s2i-core:latest/{s/^FROM ubi10\/s2i-core:latest/FROM registry.access.redhat.com\/ubi10\/s2i-core:latest/}' \
$S2I_DIRECTORY_ABS_PATH/22/Dockerfile.rhel10
sed -i '0,/^FROM ubi10-minimal:latest/{s/^FROM ubi10-minimal:latest/FROM registry.access.redhat.com\/ubi10-minimal:latest/}' \
$S2I_DIRECTORY_ABS_PATH/22-minimal/Dockerfile.rhel10

# Node 24
sed -i '0,/^FROM ubi8\/s2i-core:1/{s/^FROM ubi8\/s2i-core:1/FROM registry.access.redhat.com\/ubi8\/s2i-core:1/}' \
$S2I_DIRECTORY_ABS_PATH/24/Dockerfile.rhel8
sed -i '0,/^FROM ubi8\/ubi-minimal:latest/{s/^FROM ubi8\/ubi-minimal:latest/FROM registry.access.redhat.com\/ubi8\/ubi-minimal:latest/}' \
$S2I_DIRECTORY_ABS_PATH/24-minimal/Dockerfile.rhel8
sed -i '0,/^FROM ubi9\/s2i-core:1/{s/^FROM ubi9\/s2i-core:1/FROM registry.access.redhat.com\/ubi9\/s2i-core:1/}' \
$S2I_DIRECTORY_ABS_PATH/24/Dockerfile.rhel9
sed -i '0,/^FROM ubi9\/ubi-minimal/{s/^FROM ubi9\/ubi-minimal/FROM registry.access.redhat.com\/ubi9\/ubi-minimal/}' \
$S2I_DIRECTORY_ABS_PATH/22-minimal/Dockerfile.rhel9
sed -i '0,/^FROM ubi10\/s2i-core:latest/{s/^FROM ubi10\/s2i-core:latest/FROM registry.access.redhat.com\/ubi10\/s2i-core:latest/}' \
$S2I_DIRECTORY_ABS_PATH/24/Dockerfile.rhel10
sed -i '0,/^FROM ubi10-minimal:latest/{s/^FROM ubi10-minimal:latest/FROM registry.access.redhat.com\/ubi10-minimal:latest/}' \
$S2I_DIRECTORY_ABS_PATH/24-minimal/Dockerfile.rhel10



