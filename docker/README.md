# Docker support
We offer two main Dockerfiles: i) Table robot (Raspberry Pi 4), ii) Vision-Platooning system (ex. Intel Nuc)

In the actual implementation, the two images run on different computers(Raspberry and Nuc). The docker manager tried to manage it in an integrated way, but failed. If there is a better way to use the docker, please let [@taehun-ryu](https://github.com/taehun-ryu) know.

## 1. Table robot
```bash
cd docker
docker build --no-cache --force-rm -f Dockerfile.table --build-arg HOST_USER=$USER -t IMAGENAME:TAG .
```

## 2. Vision-Platooning system
we will upload it soon.
