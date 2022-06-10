FROM php:7.4.27-fpm-alpine

RUN apk update
RUN apk --no-cache add shadow
RUN apk --no-cache add git
RUN apk --no-cache add zip
RUN apk --no-cache add unzip
RUN apk --no-cache add poppler
RUN apk --no-cache add ffmpeg
RUN apk --no-cache add python3

# change www-data's id to 1000
RUN usermod -u 1000 www-data

# install pip and s3cmd under user www-data
USER www-data
RUN /usr/bin/env python3 -m ensurepip --upgrade
RUN /usr/bin/env python3 -m pip install --upgrade pip
RUN /home/www-data/.local/bin/pip3 install s3cmd
USER root

# set php configuration values
WORKDIR /var/www
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN sed -i 's/post_max_size = 8M/post_max_size = 1024M/' "$PHP_INI_DIR/php.ini"
RUN sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 1024M/' "$PHP_INI_DIR/php.ini"
RUN sed -i 's/memory_limit = 128M/memory_limit = 2048M/' "$PHP_INI_DIR/php.ini"

# install php extensions from mlocati image
COPY --from=docker.io/mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/
RUN install-php-extensions imagick mysqli @composer gd zip

