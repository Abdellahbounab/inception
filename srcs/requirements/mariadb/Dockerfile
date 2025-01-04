FROM debian:12

RUN apt-get update \
	&& apt-get install mariadb-server -y  \
	&& mkdir /run/mysqld  && chmod 777 /run/mysqld\
	&& apt-get install mariadb-client -y

# USER root

COPY conf/create_db.sh .

RUN chmod +x create_db.sh

EXPOSE 3306

VOLUME [ "/var/lib/mysql" ]

ENTRYPOINT [ "sh", "create_db.sh" ]

CMD [ "/usr/bin/mysqld" ]

