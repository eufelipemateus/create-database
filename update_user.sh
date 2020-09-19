#!/bin/bash

# create random password
PASSWDDB="$(openssl rand -base64 12)"

echo "Please enter root user MySQL password!"
echo "Note: password will be hidden when typing"
read -sp "Password: " rootpasswd
echo "Please enter USER name MySQL!"
read -p "User: " db_user

mysql -uroot -p${rootpasswd} -e "UPDATE mysql.user SET Password=PASSWORD('${PASSWDDB}') WHERE User='${db_user}' AND Host='localhost';"
mysql -uroot -p${rootpasswd} -e "FLUSH PRIVILEGES;"


echo -e "Update Password from user!\n User Database: ${db_user}\n New User Password: ${PASSWDDB}"