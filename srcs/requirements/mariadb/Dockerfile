FROM debian:12

RUN apt-get update \
	&& apt-get install mariadb-server -y  \
	&& mkdir /run/mysqld  && chmod 777 /run/mysqld

COPY conf/create_db.sh .

EXPOSE 3306

RUN chmod +x create_db.sh

ENTRYPOINT [ "sh", "create_db.sh" ]
