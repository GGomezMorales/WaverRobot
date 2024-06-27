#!/bin/bash

PROJECT_ROOT="$(cd "$(dirname "$0")"; cd ..; pwd)"
source ${PROJECT_ROOT}/config.sh

xhost +local:root 
docker container prune -f 
docker run --privileged --rm -it \
    --name $CONTAINER_NAME \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="${PROJECT_ROOT}/src:/waver_ws/src" \
    --volume="$XAUTH:$XAUTH" \
    --net=host \
    -t \
    ${DOCKER_IMAGE_NAME} 
    