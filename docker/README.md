# Docker support
We offer Dockerfile about the table robot.

## Prerequisites
- X11-forwarding
- nvidia-docker

## How to build image
```bash
cd docker
docker build --no-cache --force-rm --build-arg HOST_USER=$USER -t [YOUR IMAGENAME:TAG] .
```

## How to run container
```bash
cd docker
bash run_docker.sh [YOUR CONTAINER NAME] [YOUR IMAGE NAME:TAG]
```
\[YOUR IMAGE NAME:TAG] must be the same name you used when image building.
