ARG ROS_DISTRO=humble

###################################
## Base Image for robot with ROS ##
###################################
FROM osrf/ros:${ROS_DISTRO}-desktop-full
LABEL maintainer="Ryu Taehun, <xogns2079@gmail.com>"

# switch to root user
USER root
SHELL ["/bin/bash", "-c"]

ARG DEBIAN_FRONTEND=noninteractive

# Reset apt package list
RUN apt-get autoremove --purge --yes \
    && rm -rf /var/lib/apt/lists/*

# Install basic packages
RUN apt-get update \
 && apt-get install -y locales lsb-release git vim wget curl gnupg2 dirmngr unzip build-essential sudo


# Set locale
RUN dpkg-reconfigure locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install basic apt packages
RUN --mount=type=cache,target=/var/cache/apt,id=apt \
    apt-get update && apt-get upgrade -y \
    && apt-get install -q -y --no-install-recommends \
    build-essential \
    ccache \
    cmake \
    lld \
    python3-colcon-common-extensions \
    python3-colcon-coveragepy-result \
    python3-colcon-mixin \
    git libcanberra-gtk-module libcanberra-gtk3-module fuse3 libqt5svg5-dev \
    python3-pip python3-opencv python3-tk python3-pyqt5.qtwebengine \
    software-properties-common

# Use Cyclone DDS as middleware
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-${ROS_DISTRO}-rmw-cyclonedds-cpp
ENV RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

# Remove display warnings
RUN mkdir /tmp/runtime-root
ENV XDG_RUNTIME_DIR "/tmp/runtime-root"
RUN chmod -R 0700 /tmp/runtime-root
ENV NO_AT_BRIDGE 1

#############################
## Set development setting ##
#############################
#Set environment variables
ARG DEBIAN_FRONTEND=noninteractive
ARG HOST_USER
ARG UNAME=${HOST_USER}
ARG UID=1000
ARG GID=1000
ARG HOME=/home/${UNAME}

# Install extra tools for development
RUN --mount=type=cache,target=/var/cache/apt,id=apt \
    add-apt-repository ppa:sdurobotics/ur-rtde -y  \
    && apt-get update && apt-get install -y --no-install-recommends \
    gdb gdbserver nano \
    git \
    sudo \
    openssh-client \
    python3-pip \
    vim \
    wget \
    librtde librtde-dev

# Set locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Grant sudo permissions to ${UNAME} user only without password
RUN mkdir -p /etc/sudoers.d && \
    echo "${UNAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${UNAME} && \
    chmod 0440 /etc/sudoers.d/${UNAME}

# Create a group
RUN groupadd -g ${GID} usergroup
# Create a user
RUN useradd --no-log-init -m -u ${UID} -g ${GID} -s /bin/bash ${UNAME}
# Set user
USER ${UNAME}
# The WORKDIR instruction sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions.
WORKDIR $HOME

# Create a directory for ROS workspace
RUN mkdir ros_ws && chmod -R +x ./ros_ws
CMD ["/bin/bash"]
