FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

# configure timezone data
RUN apt-get update && \
    apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# install system packages
RUN apt-get install -y apt-transport-https software-properties-common && \
    add-apt-repository -y ppa:ondrej/php && \
    apt-get install -y build-essential \
        vim \
        zip \
        unzip \
        p7zip-full \
        curl \
        s3cmd \
        php7.4-fpm \
        php7.4-mysqli \
        php7.4-curl \
        php7.4-cli \
        php7.4-mbstring \
        php7.4-gd \
        php7.4-zip \
        php7.4-xml \
        poppler-utils \
        python3-pip \
        imagemagick \
        ffmpeg \
        net-tools \
        nginx

# install composer
RUN curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php && \
    php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

# set php configuration values
WORKDIR /var/www
ENV PHP_INI_DIR='/etc/php/7.4/fpm'
RUN sed -i 's/post_max_size = 8M/post_max_size = 1024M/' "${PHP_INI_DIR}/php.ini" && \
    sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 1024M/' "${PHP_INI_DIR}/php.ini" && \
    sed -i 's/memory_limit = 128M/memory_limit = 2048M/' "${PHP_INI_DIR}/php.ini" && \
    sed -i "\|include /etc/nginx/sites-enabled/*;|d" "/etc/nginx/nginx.conf"

EXPOSE 80

CMD /etc/init.d/php7.4-fpm start && service nginx start && tail --follow /var/www/logs/error.log
