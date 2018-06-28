#!/bin/sh
set -e

architecture_prefix() {
  arch=$(uname -m)
  # Docker architecture naming differs from the output of uname -m
  # See https://github.com/docker-library/official-images#architectures-other-than-amd64
  case "$arch" in
    "x86_64" )
    # No prefix for x86_64
    ;;
    "armv7l" )
    echo "arm32v7-"
    ;;
    * )
    echo "Warning: Untested architecture: $arch" >&2
    echo "Build is likely to FAIL" >&2
    echo "$arch-"
    ;;
  esac
}
