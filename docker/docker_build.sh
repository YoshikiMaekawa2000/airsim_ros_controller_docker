#!/bin/bash

image_name='airsim_source'
image_tag='unreal_engine_4.27'

docker build \
    --network=host \
    -t \
    $image_name:$image_tag \
    .
