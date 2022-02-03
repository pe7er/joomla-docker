# joomla-docker
Docker container to run Joomla

## Install Docker
https://docs.docker.com/engine/install/ubuntu/

### Install dependencies
``` 
 $ sudo apt-get update
 $ sudo apt-get install ca-certificates curl gnupg lsb-release
```
### Add Docker’s official GPG key:
```
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
$ echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

### Install docker
```
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
```

### Test
```
$ sudo docker run hello-world
```

### Test load latest Ubuntu, display its version and remove
```
$ sudo docker run --rm ubuntu:latest cat /etc/os-release
```

### Install docker composer
```
$ sudo apt install docker-compose
```

## Deploy Container

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
$ docker-compose up
```