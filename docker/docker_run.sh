image_name='airsim_source'
tag_name="unreal_engine_4.27"

xhost +local:root

docker run \
    --ipc=host \
    -it \
    --network=host \
    --rm \
    --gpus all \
    --name "airsim_source" \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    $image_name:$tag_name \
    bash

