FROM debian:12

RUN apt-get update && apt-get install -y \
	nginx \
	php-fpm \
	php-mysql \
	php-mbstring \
	php-xml \
	php-gd \
	php-curl \
	php-zip \
	wget \
	curl \
	unzip

RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xvf latest.tar.gz && \
	mv wordpress /var/www/html/ &&\
	rm latest.tar.gz

COPY conf/wp-config-create.sh /usr/local/bin/wp-config-create.sh

RUN chmod +x /usr/local/bin/wp-config-create.sh

EXPOSE 9000

CMD [ "/bin/sh", "-c", "/usr/local/bin/wp-config-create.sh && nginx -g 'daemon off;'" ]
