image_name='airsim_source'
tag_name="unreal_engine_4.27"

docker run \
    --ipc=host \
    -it \
    --network=host \
    --rm \
    --gpus all \
    --name "airsim_source" \
    $image_name:$tag_name \
    bash
