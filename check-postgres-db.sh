#!/bin/bash
#echo $1
database_name="Iiec_test$1"
echo $database_name
#sudo su - postgres -c "psql -lqt | cut -d \| -f 1|grep -qw ${database_name}"
if sudo su - postgres -c "psql -lqt | cut -d \| -f 1|grep -qw ${database_name}"; then
    echo "database exists"
else
    echo "create a new database"
    sudo su - postgres <<EOF
        psql -c "CREATE DATABASE \"${database_name}\""
EOF
    #sudo su - postgres -c 'psql create database \${database_name}'
fi
