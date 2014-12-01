#!/usr/bin/env bash

pg_bin=/usr/pgsql-9.3/bin/

if [ $(sudo -u postgres $pg_bin/psql -l | grep modip_db | wc -l) != 1 ]; then
    sudo -u postgres $pg_bin/createuser modip
    sudo -u postgres $pg_bin/createdb -O modip modip_db
fi

