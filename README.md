# joomla-docker

Docker to run Joomla site. Docker container that uses docker composer to manage multiple containers to run Joomla:
- Nginx
- MySQL

## Start up
Use ``docker compose`` to start up docker containers configured in ``docker compose.yml`` using:
```
$ docker compose up -d
```

Check docker containers bij project
```
$ docker compose ps
```

Check ALLE docker containers
```
$ docker ps
```

## Exit and close containers
```
$ docker compose down
```

## Import mySQL in container
### docker exec -i CONTAINER /usr/bin/mysql -u root --password=root DATABASE
```
docker exec -i petermartinnl_database_1 /usr/bin/mysql -u myUser --password=mySQL myDB < ./system/database/petermartin_db-20220204.sql
```

## Reload nginx
```
docker exec -it petermartinnl_nginx_1 nginx -s reload
```

## Login php container
```
docker exec -ti petermartinnl_php_1 sh
```

## Install Docker
``https://docs.docker.com/engine/install/ubuntu/``

## Test Docker
Create a test container that displays a message
```
$ sudo docker run hello-world
```

### Test load latest Ubuntu, display its version and remove
Create an Ubuntu container that displays its version
```
$ sudo docker run --rm ubuntu:latest cat /etc/os-release
```

### Build docker container
```
$ docker build --no-cache -t local-nginx .
```

### Run docker container
### connect inside port 80 to outside port 80
### map absolute path on local system to inside docker container path

```
$ sudo docker run --rm -p 80:80 -v /home/pe7er/www/mydocker/src/index.html:/var/www/html local-nginx
$ sudo docker run --rm -p 80:80 -v /home/pe7er/www/mydocker/src:/var/www/html local-nginx
```

### Check docker containers


### docker compose
```
$ docker compose up
```