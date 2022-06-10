# Instructions
## Dependencies
* podman
* podman-compose
* crun

## Building image
* You can modify `Dockerfile` to personalize the `php` image to your liking.
* You can then build it by running the command `podman-compose build`

## Tagging and uploading image to *Docker Hub*
* Create an account on [Docker](https://hub.docker.io)
* Log into your account with podman by running `podman login index.docker.io`
* Tag your image `podman tag tribe_php <username>/php:latest`
* Then publish your image on hub by running `podman push <username>/php:latest`

## Using the image
To use the image that you created, simply do `podman pull docker.io/<username>/php:latest` and then `podman run docker.io/<username>/php:latest`
