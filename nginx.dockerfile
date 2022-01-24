
# Get nginx from https://hub.docker.com/_/nginx?tab=tags
FROM nginx:stable-alpine

# Create env variables to hold user + group value
ENV NGINXUSER=joomla
ENV NGINXGROUP=joomla

# Create folder where site will be attached to
RUN mkdir -p /var/www/html

# Pull in config file with root path, server name
ADD nginx/default.conf /etc/nginx/conf.d/default.conf

# Raplace default user in config file
RUN sed -i "s/user www-data/user ${NGINXUSER}/g" /etc/nginx/nginx.conf

# Add user and add to group
RUN adduser -g ${NGINXGROUP} -s /bin/sh -D ${NGINXUSER}
