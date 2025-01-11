# !/bin/sh

#install wp command for setup the wordpress to the data base
if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
	echo "installing wp-cli"
	curl -OL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /bin/wp
	echo "wp-cli installed"
	echo "wordpress installed"
	#configure wordpress
	wp core download --path=/var/www/html/wordpress --allow-root

	cd /var/www/html/wordpress
	echo "configuring wordpress"
	wp config create --dbname=${MYSQL_NAME} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASS} --dbhost="mariadb"  --allow-root
	wp core install --url="${IP}" --title="Abounab.42" --admin_user=${WORDPRESS_ADMIN} --admin_password=${WORDPRESS_PASS} --admin_email="${WORDPRESS_ADMIN}@example.com"  --allow-root
	wp theme install twentytwentyfour  --allow-root
	wp theme activate twentytwentyfour  --allow-root

	wp user create ${MYSQL_USER} ${MYSQL_USER}@example.com --user_pass=${MYSQL_PASS} --role=subscriber --allow-root
	echo "wordpress configured"
	sed -i "s/^listen = .*/listen = 0.0.0.0:9000/" /etc/php/8.2/fpm/pool.d/www.conf

	chown -R www-data:www-data /var/www/html/
	chmod -R 777 /var/www/html/
fi 

exec php-fpm8.2 -F