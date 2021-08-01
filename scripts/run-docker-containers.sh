#!/bin/bash

PROJECT=$1
REGION=$2
REGISTRY=$3
NUM_OF_DEVICES=$4

counter=1
while [ $counter -le $NUM_OF_DEVICES ]; do
    docker run -d -v /secrets:/secrets \
        --name device_simulator_$counter \
        -e private_key_file=/secrets/rsa_private.pem \
        -e device_id=device$counter \
        -e registry_id=$REGISTRY \
        -e cloud_region=$REGION \
        -e project_id=$PROJECT \
        python-iot-sensor

    counter=$((counter + 1))
done
