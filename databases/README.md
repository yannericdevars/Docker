# Best practices

In the best practices the containers must be started, stoped, destroyed everytime and you must not lost datas.

The best examples is databases.

## We use the officials containers here : 

### First you must create the folders in your local machine
- mkdir -p /var/data/mongo
- mkdir -p /var/data/mysql

### Second you must lauch images with the link between local folder and container folder 
- docker run --name my-mongo -v /var/data/mongo:/data/db -d mongo
- docker run --name my-mysql -v /var/data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=password -d mysql


I created " sh " to automatize things
