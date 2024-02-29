#!/bin/bash

set -e

# Define MySQL connection details
HOST="127.0.0.1"
USER="root"
PASSWORD="$MYSQL_ROOT_PASSWORD"
DATABASE="sakila"

# Check if MySQL is already running
if ! mysqladmin ping -h $HOST -u $USER -p"$MYSQL_ROOT_PASSWORD" &> /dev/null; then
  # Start MySQL

  # Wait for MySQL to be ready
  while ! mysqladmin ping -h $HOST -u $USER -p"$MYSQL_ROOT_PASSWORD" &> /dev/null; do
    echo "Waiting for MySQL to start..."
    sleep 1
  done

  echo "MySQL is now running."
fi

# Connect to MySQL
echo -e "\nMySQL login:\n"
mysql -h "$HOST" -u "$USER" -p"$PASSWORD" "$DATABASE"
