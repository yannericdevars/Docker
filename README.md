# Docker 

In the root folder, this is a simple group files to initialise a minimum docker container for a Symfony 3 project

Install 

- Lamp environment
- SSH server
- Symfony 3 with mysql database
- Mongo
- Redis

You must start all servers by yourself

## Build

```sudo docker build -t server . ```

## Launch

```sudo docker run -i -t server /bin/bash ```

## Start servers

- /etc/init.d/apache2 start
- /etc/init.d/mysql start
- redis-server /etc/redis/redis.conf (Your conf must set : daemonize yes)
- mongod


