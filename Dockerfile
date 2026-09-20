FROM ubuntu:26.04
LABEL autor="Sto Cazzo (tm)"
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt upgrade -y
RUN apt install -y vim git curl tar clang gcc sbcl ecl
# no quicklisp 'cause we're gonna vendor the shit out of this :3

# raylib deps taken from dockerfile at
# https://github.com/Karscist/penultttimate
# raylib readme lists these dependecies for ubuntu
RUN apt install -y libasound2-dev libx11-dev libxrandr-dev libxi-dev \
    libgl1-mesa-dev libglu1-mesa-dev libxcursor-dev \
    libxinerama-dev libwayland-dev libxkbcommon-dev

# they also only lists wayland packages needed to compile on fedora
# [ wayland-devel libxkbcommon-devel wayland-protocols-devel ]
# the ones below are the debian equivalents
# (partly taken from glfw docs)
# https://www.glfw.org/docs/latest/compile_guide.html#compile_deps_wayland
RUN apt install -y wayland-protocols libwayland-dev libxkbcommon-dev

RUN mkdir -p /root/workspace/
ENV PATH="$PATH:/root/workspace/tools"
