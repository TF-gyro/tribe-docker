#!/usr/bin/env bash

if [ "$1" == "--no-cache" ]; then
    # don't use cache
    docker build --no-cache -t tribeframework/tribe:latest .
else
    # use cache
    docker build -t tribeframework/tribe:latest .
fi
