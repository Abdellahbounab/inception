#!/bin/bash

# Define the directory path
DIR="/home/abounab/data/"

# Check if the directory exists
if [ ! -d "$DIR" ]; then
	# Create the directory if it does not exist
	mkdir -p "$DIR"/mariadb
	mkdir -p "$DIR"/wordpress
	echo "Volume $DIR created."
fi