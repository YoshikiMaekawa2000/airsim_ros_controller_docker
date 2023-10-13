image_name='airsim_binary'
tag_name="ubuntu18.04"

docker run \
    --ipc=host \
    -it \
    --network=host \
    --rm \
    --gpus all \
    --name "airsim_binary" \
    $image_name:$tag_name \
    bash
