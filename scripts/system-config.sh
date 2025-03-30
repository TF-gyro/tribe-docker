#!/usr/bin/env bash

apt-get update && apt-get upgrade -y

# configure timezone data
apt-get install -y tzdata apt-utils software-properties-common apt-transport-https build-essential
ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
dpkg-reconfigure tzdata

# install system packages
apt-get update && apt-get install -y vim \
    zip \
    unzip \
    p7zip-full \
    curl \
    s3cmd \
    php8.3-fpm \
    php8.3-mysqli \
    php8.3-curl \
    php8.3-cli \
    php8.3-mbstring \
    php8.3-gd \
    php8.3-zip \
    php8.3-xml \
    poppler-utils \
    python3-pip \
    imagemagick \
    ffmpeg \
    net-tools \
    nginx \
    git \
    pdftk \
    poppler-utils \
    wget \
    jq

# install composer
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php && \
php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

# set www-data's home directory
usermod -d /tmp/www-data www-data
