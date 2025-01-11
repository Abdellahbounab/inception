FROM debian:12

RUN apt-get update && apt-get install -y \
	php-fpm \
	php-mysql \
	php-curl \
	php-zip \
	curl

EXPOSE 9000

COPY conf/wp-config-create.sh /usr/local/bin/wp-config-create.sh

RUN chmod +x /usr/local/bin/wp-config-create.sh

CMD [ "/bin/sh", "-c", "/usr/local/bin/wp-config-create.sh" ]
