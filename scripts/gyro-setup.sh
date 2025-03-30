#!/usr/bin/env bash

if [[ ! -v GYRO_VER ]];
then
    export GYRO_VER=$(curl -s https://api.github.com/repos/tribe-framework/flame-junction-dist/tags | jq -r '.[0].name')
fi

wget "https://github.com/tf-gyro/flame-junction-dist/archive/refs/tags/$(GYRO_VER).tar.gz" -O gyro.tgz
mkdir gyro-dist
tar -xzf gyro.tgz -C gyro-dist --strip-components=1
mv gyro-dist/applications/junction .
rm -rf gyro.tgz gyro-dist
