#!bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]; then
	echo "Creating database..."
	cat << EOF > /tmp/create_db.sql
		USE mysql;
		FLUSH PRIVILEGES;
		ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT}';
		CREATE DATABASE ${MYSQL_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
		CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED by '${MYSQL_PASS}';
		GRANT ALL PRIVILEGES ON ${MYSQL_NAME}.* TO '${MYSQL_USER}'@'%';
		FLUSH PRIVILEGES;
EOF
# run init.sql
	echo "database created"
mariadbd --user=mysql --bootstrap  < /tmp/create_db.sql
rm -f /tmp/create_db.sql
fi

exec mariadbd --user=mysql --bind-address=0.0.0.0