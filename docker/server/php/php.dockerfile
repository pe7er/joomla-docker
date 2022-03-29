# Get php/nginx from https://hub.docker.com/_/php
FROM php:8.0-fpm-alpine

# When using PHP 7.4, we'll need to use a different apline package
# https://stackoverflow.com/questions/70181574/php-fpm-alpine-docker-image-7-4-installs-php-version-8-0
# FROM php:7.4-fpm-alpine3.14

# Create env variables to hold user + group value
ENV PHPUSER=pe7er
ENV PHPGROUP=pe7er

# Add user and add to group
RUN adduser -g ${PHPGROUP} -s /bin/sh -D ${PHPUSER}

# /user/local/etc/php-fpm.d/www.conf:

# Raplace default user in php ini
RUN sed -i "s/user - www-data/user - ${PHPUSER}/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group - www-data/group - ${PHPGROUP}/g" /usr/local/etc/php-fpm.d/www.conf

# Create folder where site will be attached to
RUN mkdir -p /var/www/html
RUN chown -R pe7er:pe7er /var/www/html

# Install the php-mysql
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Install dependencies for GD and install GD with support for jpeg, png webp and freetype
# https://www.php.net/manual/en/image.installation.php
RUN apk add --no-cache \
        libjpeg-turbo-dev \
        libpng-dev \
        libwebp-dev \
        freetype-dev

# As of PHP 7.4 we don't need to add --with-png
RUN docker-php-ext-configure gd --with-jpeg --with-webp --with-freetype
RUN docker-php-ext-install gd

# run PHP as Root
CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]
