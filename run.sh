#!/bin/bash

set -o errexit

app=yourapp

echo "[$app] building..."
docker build -t $app . > /dev/null

docker volume create --name=$app > /dev/null

if docker inspect --type=container $app > /dev/null 2>&1; then
    echo "[$app] removing old version..."
    docker rm -f $app > /dev/null
fi

echo "[$app] starting..."
docker run \
    -d \
    --restart unless-stopped \
    --name $app \
    $app > /dev/null

echo "[$app] done"
