FROM debian:11

RUN apt-get update \
	&& apt-get install mariadb-server -y  \
	&& mkdir /run/mysqld  && chmod 777 /run/mysqld

COPY conf/create_db.sh .

EXPOSE 3306

RUN chmod +x create_db.sh

ENTRYPOINT [ "sh", "create_db.sh" ]

CMD [ "mariadbd --user=mysql --bind-address=0.0.0.0" ]