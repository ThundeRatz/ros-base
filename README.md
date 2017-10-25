# ros-base

Minimal ROS base container. Provides containers for ARM and x64 with ROS core and tools (e.g. rosdep, wstool) as a base for other repositories. Includes minimal automation to run on `docker` or `nvidia-docker`.

## Warning:
These containers are used in deployments in real robots, and thus have hardware access. The [run.sh](run.sh) script runs the container in privileged mode with access to GPU, USB, host networking, X server, among other things. If security is a concern, don't use it!
