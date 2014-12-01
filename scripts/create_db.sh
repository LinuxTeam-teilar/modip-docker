#!/usr/bin/env bash

pg_data_dir=/var/lib/pgsql/9.3

if [ -d $pg_data_dir ]; then
    rm -r $pg_data_dir
fi

sudo -u postgres /usr/pgsql-9.3/bin/initdb /var/lib/pgsql/9.3/
