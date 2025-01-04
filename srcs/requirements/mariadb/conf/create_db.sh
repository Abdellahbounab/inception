#!bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]; then
	echo "Creating database..."
	cat << EOF > /tmp/create_db.sql
		USE mysql;
		FLUSH PRIVILEGES;
		ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';
		CREATE DATABASE ${DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
		CREATE USER '${DB_USER}'@'%' IDENTIFIED by '${DB_PASS}';
		GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
		FLUSH PRIVILEGES;
EOF
# run init.sql
mariadbd --user=mysql --bootstrap  < /tmp/create_db.sql
rm -f /tmp/create_db.sql
fi

exec mariadbd --user=mysql --bind-address=0.0.0.0