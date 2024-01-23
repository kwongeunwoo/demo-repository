#!/bin/bash
# Sample script to run a command in a Docker container
#
# Usage Example:
# ./run_docker.sh turtlebot3_behavior:overlay "ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py"

# Define Docker volumes and environment variables
DOCKER_VOLUMES="
--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
--volume="${XAUTHORITY:-$HOME/.Xauthority}:/root/.Xauthority" \
--volume="/dev/video0:/dev/video0" \
"
DOCKER_ENV_VARS="
--env="DISPLAY" \
--env="QT_X11_NO_MITSHM=1" \
--env="NVIDIA_DRIVER_CAPABILITIES=all" \
"
DOCKER_ARGS=${DOCKER_VOLUMES}" "${DOCKER_ENV_VARS}

# Run the command
# $1: container name, $2: image name
docker run -it --net=host --ipc=host --privileged --gpus all ${DOCKER_ARGS} --name "$1" "$2"