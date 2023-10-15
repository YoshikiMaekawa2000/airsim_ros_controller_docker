#!/bin/bash

image_name='airsim_source'
image_tag='ubuntu18.04'

docker build \
    --network=host \
    -t \
    $image_name:$image_tag \
    .
