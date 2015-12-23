mkdir -p /var/data/mongo
mkdir -p /var/data/mysql

docker run --name my-mongo-share -v /var/data/mongo:/data/db -d mongo
docker run --name my-mysql-share -v /var/data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=password -d mysql

