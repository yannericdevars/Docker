FROM debian:stable
MAINTAINER Yann-Eric Devars

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:admin' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

RUN apt-get install -y apache2 
RUN apt-get install -y php5 

# Install mysql
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server
RUN apt-get install -y libapache2-mod-php5 
RUN apt-get install -y php5-mysql

# Install necesary softwares
RUN apt-get install -y vim wget

# Install minimum symfony 3
RUN rm -Rf /var/www/html/index.html
RUN apt-get install -y curl
RUN curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony
RUN cd /var/www/html && symfony new .
RUN mkdir -p /var/www/html/var/cache
RUN mkdir -p /var/www/html/var/logs
RUN chmod -Rf 777 /var/www/html/var/cache
RUN chmod -Rf 777 /var/www/html/var/logs
RUN rm -Rf /var/www/html/app/config/parameters.yml
ADD parameters.yml /var/www/html/app/config
RUN rm -Rf /var/www/html/web/app_dev.php
ADD app_dev.php /var/www/html/web
 
# Start apache
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

RUN rm -Rf /etc/apache2/sites-available/000-default.conf
ADD 000-default.conf /etc/apache2/sites-available

# Install NoSql Databases
RUN apt-get install -y mongodb
RUN apt-get install -y redis-server

# Allow sync capacity with local folder
RUN apt-get install -y rsync
