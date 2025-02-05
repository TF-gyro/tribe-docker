#!/usr/bin/env bash

VER=$(curl https://api.github.com/repos/tribe-framework/flame-junction-dist/tags | jq -r '.[0].name')

echo "Building with junction $VER"
sleep 3s;
sed -i "s|flame-junction-dist.*.tar.gz|flame-junction-dist/archive/refs/tags/$VER.tar.gz|" Dockerfile

if [ "$1" == "--no-cache" ]; then
    # don't use cache
    docker build --no-cache -t tribeframework/tribe:latest .
else
    # use cache
    docker build -t tribeframework/tribe:latest .
fi
