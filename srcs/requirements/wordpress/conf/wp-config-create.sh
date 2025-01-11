#!/bin/sh

#install wp command for setup the wordpress to the data base
if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
	echo "installing wp-cli"
	curl -OL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	#configure wordpress
	
	wp core download --path=/var/www/html/wordpress --allow-root

	cd /var/www/html/wordpress

	wp config create --dbname=${MYSQL_NAME} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASS} --dbhost="mariadb"  --allow-root
	wp core install --url="${IP}" --title="Inception" --admin_user=${WORDPRESS_ADMIN} --admin_password=${WORDPRESS_PASS} --admin_email="${WORDPRESS_ADMIN}@example.com"  --allow-root
	wp theme install twentytwentythree  --allow-root
	wp theme activate twentytwentythree  --allow-root

	wp user create ${MYSQL_USER} ${MYSQL_USER}@example.com --user_pass=${MYSQL_PASS} --role=subscriber --allow-root

   # Ensure PHP-FPM listens on all interfaces
    sed -i "s/^listen = .*/listen = 0.0.0.0:9000/" /etc/php/7.4/fpm/pool.d/www.conf
	
	chown -R www-data:www-data /var/www/html/wordpress
	chmod -R 755 /var/www/html/wordpress

fi 

exec php-fpm7.4 -F