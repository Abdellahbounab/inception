FROM debian:11

# Update package list and install necessary packages
RUN apt-get update && apt-get install -y \
	php-cli \
	php-mysqli \
	wget

# Download Adminer
RUN mkdir -p /var/www/html/adminer &&\
	wget -L https://www.adminer.org/latest.php -O /var/www/html/adminer.php

RUN chown -R www-data:www-data /var/www/html/adminer.php &&\
	chmod -R 755 /var/www/html/adminer.php &&\
	mv /var/www/html/adminer.php /var/www/html/index.php

# Expose the port Adminer will run on
EXPOSE 8080

# Start the PHP built-in server to serve Adminer
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]