#!/bin/bash

# create random password
PASSWDDB="$(openssl rand -base64 12)"

echo "Please enter root user MySQL password!"
echo "Note: password will be hidden when typing"
read -sp "Password: " rootpasswd
echo "Please enter new DB name MySQL!"
read -p "DB: " db
echo "Please enter new USER name MySQL!"
read -p "User: " db_user

mysql -uroot -p${rootpasswd} -e "CREATE DATABASE ${db} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
mysql -uroot -p${rootpasswd} -e "CREATE USER ${db_user}@localhost IDENTIFIED BY '${PASSWDDB}';"
mysql -uroot -p${rootpasswd} -e "GRANT ALL PRIVILEGES ON ${db}.* TO '${db_user}'@'localhost';"
mysql -uroot -p${rootpasswd} -e "FLUSH PRIVILEGES;"

echo -e "Database:  ${db}\n User Database: ${db_user}\n User Password: ${PASSWDDB}"