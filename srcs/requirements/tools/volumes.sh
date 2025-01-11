#!/bin/bash

# Define the directory path
DIR="/home/abounab/data/"

# Check if the directory exists
if [ ! -d ${DIR} ]; then
	# Create the directory if it does not exist
	mkdir -p "${DIR}"/mariadb
	mkdir -p "${DIR}"/wordpress
	sudo chown -R www-data:www-data "${DIR}"/wordpress
	sudo chmod -R 777 "${DIR}"/wordpress

	echo "Volumes $DIR* created."
else
	echo "Volumes already exists."
fi