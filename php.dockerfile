
# Get nginx from https://hub.docker.com/_/php
FROM php:8-fpm-alpine

# Create env variables to hold user + group value
ENV PHPUSER=joomla
ENV PHPGROUP=joomla

# Add user and add to group
RUN adduser -g ${PHPGROUP} -s /bin/sh -D ${PHPUSER}

# /user/local/etc/php-fpm.d/www.conf:

# Raplace default user in php ini
RUN sed -i "s/user - www-data/user - ${PHPUSER}/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group - www-data/group - ${PHPGROUP}/g" /usr/local/etc/php-fpm.d/www.conf

# Create folder where site will be attached to
RUN mkdir -p /var/www/html

# Install the php-mysql
RUN docker-php-ext-install pdo pdo_mysql

# run PHP as Root
CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]