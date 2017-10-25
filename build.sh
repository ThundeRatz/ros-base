#!/bin/bash
set -e

arch=$(uname -m)
case "$arch" in
  "x86_64" )
    ;;
  "armv7l" )
    base_image_prefix="$arch/"
    ;;
  * )
    echo "Warning: Unsupported architecture: $arch" >&2
    echo "Build is likely to FAIL" >&2
    base_image_prefix="$arch/"
    ;;
esac

cd "$(dirname "$0")/docker"
docker build -t "thunderatz/${arch}-ros-base" --build-arg base_image_prefix="$base_image_prefix" .
