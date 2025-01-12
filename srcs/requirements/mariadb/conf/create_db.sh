#!/bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]; then
	echo "Creating database..."
	cat << EOF > /tmp/create_db.sql
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT}';
CREATE DATABASE ${MYSQL_NAME};
CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}';
GRANT ALL PRIVILEGES ON ${MYSQL_NAME}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF
	echo "Database created"
	mariadbd --user=mysql --bootstrap < /tmp/create_db.sql
	rm -f /tmp/create_db.sql
fi

exec $@