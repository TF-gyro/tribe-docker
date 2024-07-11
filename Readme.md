# Instructions
## Dependencies
* docker

## Building image
* You can modify `Dockerfile` to personalize the `php` image to your liking.
* You can then build the image using script `build.sh`. Pass `--no-cache` to disable using the cached builds

## Tagging and uploading image to *Docker Hub*
* Create an account on [Docker](https://hub.docker.io)
* Log into your account with podman by running `docker login`
* Tag your image `docker tag tribeframework/tribe:latest tribeframework/tribe:tagname`
* Then publish your image on hub by running `docker push tribeframework/tribe:tagname`

## Using the image
To use the image that you created, simply do `docker pull tribeframework/tribe:latest`
