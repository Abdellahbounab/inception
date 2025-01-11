FROM debian:11

RUN apt-get update && apt-get install -y \
	php-fpm \
	php-mysql \
	php-curl \
	php-zip \
	curl

COPY conf/wp-config-create.sh /usr/local/bin/wp-config-create.sh

RUN chmod +x /usr/local/bin/wp-config-create.sh

RUN mkdir -p /run/php && \
    chown -R www-data:www-data /run/php && \
    chmod -R 755 /run/php

EXPOSE 9000

CMD [ "/bin/sh", "-c", "/usr/local/bin/wp-config-create.sh" ]
