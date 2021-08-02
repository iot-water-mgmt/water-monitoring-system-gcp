#!/bin/bash

docker ps --filter name=device_simulator_* --filter status=running -aq | xargs -r docker stop
docker system prune -f
docker ps -a