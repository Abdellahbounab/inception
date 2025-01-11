#!/bin/bash

# Define the directory path
DIR="/home/abounab/data/"

# Check if the directory exists
if [ ! -d "$DIR" ]; then
	# Create the directory if it does not exist
	echo hh
	mkdir -p "$DIR"/mariadb
	mkdir -p "$DIR"/wordpress
	chown -R www-data:www-data "$DIR"/wordpress
	chmod -R 777 "$DIR"/wordpress
	echo "Volume $DIR created."
fi