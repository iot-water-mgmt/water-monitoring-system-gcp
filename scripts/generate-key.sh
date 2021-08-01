#!/bin/bash

FILE=rsa_private.pem
DIR=secrets

mkdir -p $DIR
cd $DIR

if [ -f "$FILE" ]; then
    echo "$FILE already exists. Do nothing!!"
else 
    echo "$FILE does not exist."
    echo "Generating the key..."
    openssl req -x509 -newkey rsa:2048 -keyout rsa_private.pem -nodes -out rsa_cert.pem -subj "/CN=unused"
fi