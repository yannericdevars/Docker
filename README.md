# Docker for Symfony 3

In the root folder, this is a simple group files to initialise a minimum docker container for a Symfony 3 project, for simple training.

If you want a more realistic architecture, take a look in *multi-servers* folder :)

In good practice, you must separate all elements : web server, databases etc. ... And have minimum things on each other, take a look in *another subfolders*

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

## Launch with demon mode

```sudo docker run -d -P --name sfProject server ```

## If you want to connect in SSH (You must activate the port)

- ```sudo docker port sfProject 22 ```
- ```ssh root@<IP> ```
- The password is : admin

## Commands

### List processes
```sudo docker ps ```

### Obtain IP
```sudo docker inspect <ID> ```

## Start servers (when you are connected in container)

- /etc/init.d/apache2 start
- /etc/init.d/mysql start
- redis-server /etc/redis/redis.conf (Your conf must set : daemonize yes)
- mongod


