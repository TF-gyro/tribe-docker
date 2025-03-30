#!/usr/bin/env bash

if [[ ! -v PHP_INI_DIR ]];
then
    export PHP_INI_DIR='/etc/php/8.3/fpm'
fi

if [[ ! -v TRIBE_VER ]];
then
    export TRIBE_VER=$(curl -s https://api.github.com/repos/tribe-framework/tribe/tags | jq -r '.[0].name')
fi

# if current directory isn't /var/www, change to it
[[ $(pwd) = "/var/www" ]] || cd /var/www


sed -i 's/post_max_size = 8M/post_max_size = 1024M/' "${PHP_INI_DIR}/php.ini"
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 1024M/' "${PHP_INI_DIR}/php.ini"
sed -i 's/memory_limit = 128M/memory_limit = 2048M/' "${PHP_INI_DIR}/php.ini"
sed -i "\|include /etc/nginx/sites-enabled/\*;|d" "/etc/nginx/nginx.conf"

# setup latest version of Tribe
wget "https://github.com/tf-gyro/tribe/archive/refs/tags/$(TRIBE_VER).tar.gz" -O tribe.tar.gz
tar -xzf tribe.tar.gz -C /var/www --strip-components=1
composer u

wget https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.tar.gz -O pma.tar.gz
mkdir /var/www/phpmyadmin && tar -xzf pma.tar.gz -C /var/www/phpmyadmin --strip-components=1

# cleanup packages
rm tribe.tar.gz pma.tar.gz
