FROM debian:11

RUN apt-get update && apt-get install -y \
	php-fpm \
	php-mysql \
	curl

COPY conf/wp-config-create.sh .

RUN chmod +x ./wp-config-create.sh

RUN mkdir -p /run/php && \
    chown -R www-data:www-data /run/php && \
    chmod -R 755 /run/php && \
	sed -i "s/^listen = .*/listen = 0.0.0.0:9000/" /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

ENTRYPOINT [ "sh", "./wp-config-create.sh" ]

CMD [ "php-fpm7.4 -F" ]
