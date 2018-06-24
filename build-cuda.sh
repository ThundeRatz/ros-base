#!/bin/sh
set -e
cd "$(dirname "$0")"
docker build -t "thunderatz/ros-base-cuda" --build-arg base_image=nvidia/cuda:9.2-cudnn7-devel-ubuntu16.04 docker/
