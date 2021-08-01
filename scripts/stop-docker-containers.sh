#!/bin/bash

docker ps --filter name=device_simulator_* --filter status=running -aq | xargs docker stop
