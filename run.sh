#!/bin/bash
set -e

cd "$(dirname "$0")"
if which nvidia-docker > /dev/null 2>&1 ; then
    DOCKER=nvidia-docker
else
    echo "nvidia-docker not found, GPU acceleration won't be supported"
    DOCKER=docker
fi

xhost +local:root
CMD="$DOCKER run --rm --privileged --network host -e DISPLAY -e QT_X11_NO_MITSHM=1 -v /dev/bus/usb -v /tmp/.X11-unix:/tmp/.X11-unix:ro"
CONTAINER="thunderatz/ros-base"
if (( $# == 0 )) ; then
    eval "$CMD $CONTAINER"
else
    eval "$CMD -ti $CONTAINER \"$*\""
fi
