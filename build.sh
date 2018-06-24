#!/bin/sh
set -e
cd "$(dirname "$0")"
source ./helpers.sh
image_prefix=$(architecture_prefix)
docker build -t "thunderatz/${image_prefix}ros-base" --build-arg base_image=${image_prefix/-/\/}ubuntu:xenial docker/
