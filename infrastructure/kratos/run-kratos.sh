#!/bin/sh
# need envs:
#  - MYSQL_USER 
#  - MYSQL_PASSWORD
#  - MYSQL_HOST

##################################################
# generate kratos config file                    #
##################################################
export DSN="mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@tcp(${MYSQL_HOST}:3306)/kratos"

cp kratos-without-dsn.yml .kratos.yaml
echo "dsn: ${DSN}" >> ".kratos.yaml"

##################################################
# ensure kratos database and dsn                 #
##################################################

echo "$(mysql -h${MYSQL_HOST} -u${MYSQL_USER} -p${MYSQL_PASSWORD} -e "SHOW DATABASES")" |grep -q "kratos";
if [ $? -eq 0 ];
then
    echo kratos database already
else
    mysql -h${MYSQL_HOST} -u${MYSQL_USER} -p${MYSQL_PASSWORD} -e "CREATE DATABASE kratos"
    kratos migrate sql -e -y
fi

##################################################
# run kratos                                     #
##################################################
kratos serve