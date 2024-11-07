#!/usr/bin/env bash

docker stop server
docker rm server

docker pull ubuntu:latest
docker run -dit --name server --network=host ubuntu:latest /bin/bash
docker cp bash.env server:/home/bash.env
docker cp load_start.sh server:/home/load_start.sh
docker exec -it server /bin/bash
