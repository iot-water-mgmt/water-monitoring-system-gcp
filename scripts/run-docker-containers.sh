#!/bin/bash

PROJECT=$1
REGION=$2
REGISTRY=$3
NUM_OF_DEVICES=$4
NUM_OF_MESSAGES=$5
HISTORICAL_DATA=$6

counter=1
while [ $counter -le $NUM_OF_DEVICES ]; do
    docker run -d -v $HOME/secrets:/$HOME/secrets \
        --name device_simulator_$counter \
        -e private_key_file=$HOME/secrets/rsa_private.pem \
        -e device_id=device$counter \
        -e registry_id=$REGISTRY \
        -e cloud_region=$REGION \
        -e project_id=$PROJECT \
        -e num_messages=$NUM_OF_MESSAGES
        -e historical_data=$HISTORICAL_DATA
        python-iot-sensor

    counter=$((counter + 1))
done
