#!/bin/bash
for db in `sudo su - postgres -c "psql -lqt | cut -d \| -f 1|grep Iiec_test"`
do
        sudo su - postgres <<EOF
                psql -c "DROP DATABASE \"${db}\""
EOF
done
