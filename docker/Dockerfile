ARG base_image_prefix=
FROM ${base_image_prefix}ubuntu:xenial
MAINTAINER Tiago Koji Castro Shibata

RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential dirmngr locales sudo \
    && rm -rf /var/lib/apt/lists/*
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

# ROS base
RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 421C365BD9FF1F717815A3895523BAEEB01FA116 \
    && echo 'deb http://packages.ros.org/ros/ubuntu xenial main' > /etc/apt/sources.list.d/ros.list
ENV ROS_DISTRO kinetic
RUN apt-get update && apt-get install --no-install-recommends -y \
    ros-kinetic-ros-base python-rosdep python-wstool \
    && rm -rf /var/lib/apt/lists/*

# Non-root user
RUN useradd -mG sudo ros && echo source "/opt/ros/$ROS_DISTRO/setup.bash" >> ~ros/.bashrc \
    && mkdir -p /etc/sudoers.d && echo '%sudo   ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/sudo_nopasswd
