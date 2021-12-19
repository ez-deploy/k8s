#!/bin/sh
# need envs:
#  - MYSQL_USER 
#  - MYSQL_PASSWORD
#  - MYSQL_HOST

##################################################
# ensure kratos database and dsn                 #
##################################################
export DSN="mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@tcp(${MYSQL_HOST}:3306)/kratos"

echo "$(mysql -h${MYSQL_HOST} -u${MYSQL_USER} -p${MYSQL_PASSWORD} -e "SHOW DATABASES")" |grep -q "kratos";
if [ $? -eq 0 ];
then
    echo kratos database already
else
    mysql -h${MYSQL_HOST} -u${MYSQL_USER} -p${MYSQL_PASSWORD} -e "CREATE DATABASE kratos"
    kratos migrate sql -e -y
fi

##################################################
# generate kratos config file                    #
##################################################
cp kratos-without-dsn.yml kratos.yml
echo "dsn: ${DSN}" >> "kratos.yml"

##################################################
# run kratos                                     #
##################################################
kratos serve -c kratos.yml