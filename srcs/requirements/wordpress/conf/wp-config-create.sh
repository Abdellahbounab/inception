# !/bin/sh

#install wp command for setup the wordpress to the data base
curl -OL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /bin/wp

chown -R www-data:www-data /var/www/html/
chmod -R 777 /var/www/html/

#configure wordpress
wp core download --path=/var/www/html/wordpress --allow-root

rm -fr /var/www/html/wordpress/wp-config.php
cd /var/www/html/wordpress

wp config create --dbname=${MYSQL_NAME} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASS} --dbhost="mariadb"  --allow-root

wp core install --url="https://abounab.42.fr" --title="Abounab.42" --admin_user="bnb" --admin_password="bnbMolChi" --admin_email="admin@example.com"  --allow-root

wp theme install twentytwentyfour  --allow-root
wp theme activate twentytwentyfour  --allow-root

wp user create ${MYSQL_USER} ${MYSQL_USER}@example.com --user_pass=${MYSQL_PASS} --role=subscriber --allow-root

sed -i "s/^listen = .*/listen = 0.0.0.0:9000/" /etc/php/8.2/fpm/pool.d/www.conf

rm -fr /usr/local/bin/wp-config-create.sh

exec php-fpm8.2 -F