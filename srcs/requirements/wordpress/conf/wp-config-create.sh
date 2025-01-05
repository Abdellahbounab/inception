# !/bin/sh

# Create wp-config.php
# if [ ! -f /var/www/html/wp-config.php ]; then
# 	cat <<EOF > /var/www/html/wp-config.php
# <?php
# define('DB_NAME', '${MYSQL_NAME}');
# define('DB_USER', '${MYSQL_USER}');
# define('DB_PASSWORD', '${MYSQL_PASS}');
# define('DB_HOST', '${MYSQL_ROOT}');
# define('DB_CHARSET', 'utf8');
# define('DB_COLLATE', '');
# \$table_prefix = 'wp_';
# define('WP_DEBUG', false);
# if ( !defined('ABSPATH') )
# 	define('ABSPATH', dirname(__FILE__) . '/');
# 	define('WP_REDIS_HOST', 'redis');
# require_once(ABSPATH . 'wp-settings.php');
# EOF
# fi


# Default values for WordPress database connection
# MYSQL_NAME=${MYSQL_NAME}
# MYSQL_USER=${MYSQL_USER}
# MYSQL_PASSWORD=${MYSQL_PASS}
# MYSQL_HOST=${MYSQL_HOST}

# # Generate wp-config.php
# cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wp-config.php

# # Replace placeholders with environment variables
# sed -i "s/database_name_here/${MYSQL_NAME}/" /var/www/html/wp-config.php
# sed -i "s/username_here/${MYSQL_USER}/" /var/www/html/wp-config.php
# sed -i "s/password_here/${MYSQL_PASSWORD}/" /var/www/html/wp-config.php
# sed -i "s/localhost/${MYSQL_HOST}/" /var/www/html/wp-config.php

# # Set correct permissions for the WordPress files
# chown -R www-data:www-data /var/www/html

# # Run the command to start PHP-FPM and NGINX (ensure the web server runs)
# exec "$@"


#install wp command for setup the wordpress to the data base
curl -OL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /bin/wp

# install wordpress
# wget https://wordpress.org/latest.tar.gz
# tar -xvzf latest.tar.gz
# rm -fr latest.tar.gz
# mkdir -p /var/www/html && cp -r wordpress /var/www/html/

chown -R www-data:www-data /var/www/html/
chmod -R 777 /var/www/html/
#configure wordpress
rm -fr /var/www/html/wordpress/wp-config.php
cd /var/www/html/wordpress
wp config create --dbname=${MYSQL_NAME} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASS} --dbhost=${MYSQL_HOST}:3306  --allow-root
wp core install --url="localhost" --title="Your Site Title" --admin_user="bnb" --admin_password="bnbMolChi" --admin_email="admin@example.com"  --allow-root
wp theme install twentytwentyfour  --allow-root
wp theme activate twentytwentyfour  --allow-root


sed -i "s/^listen = .*/listen = 0.0.0.0:9000/" /etc/php/8.2/fpm/pool.d/www.conf



rm -fr setup.sh

exec php-fpm8.2 -F