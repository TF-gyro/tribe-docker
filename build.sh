#!/usr/bin/env bash

VER=$(curl -s https://api.github.com/repos/tribe-framework/flame-junction-dist/tags | jq -r '.[0].name')

read -p "Building with Junction $VER. Continue? (Y/n) " u_confirm

if [ $u_confirm = "Y" ]; then
    sed -i "s|flame-junction-dist.*.tar.gz|flame-junction-dist/archive/refs/tags/$VER.tar.gz|" Dockerfile

    if [ "$1" == "--no-cache" ]; then
        # don't use cache
        docker build --no-cache -t tribeframework/tribe:latest .
    else
        # use cache
        docker build -t tribeframework/tribe:latest .
    fi
fi

