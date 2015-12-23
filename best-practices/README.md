# Best practices

In the best practices the containers must be started, stoped, destroyed everytime and you must not lost datas.

The best examples is databases.

## We use the officials containers here : 

### First you must create the folders in your local machine
- mkdir -p /var/data/mongo
- mkdir -p /var/data/mysql

### Second you must lauch images with the link between local folder and container folder 
- docker run --name my-mongo-share -v /var/data/mongo:/data/db -d mongo
- docker run --name my-mysql-share -v /var/data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=password -d mysql


I created " sh " to automatize things

# Apache web server

We need also a server

docker run -it --rm --name my-apache -v /var/www:/usr/local/apache2/htdocs/ httpd:2.4

- We started him in interactive mode to see the logs
- We can develop localy in /var/www and see the changes on the distant server

