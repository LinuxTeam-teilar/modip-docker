#!/usr/bin/env bash

run_command="sudo -u modip"
modip_dir=/var/lib/modip/modip

if [ ! -d $modip_dir ]; then
    echo "foo"
    # $run_command git clone something
fi

cd $modip_dir

if [ ! -f $modip_dir/modip.conf ]; then
    $run_command cp $modip_dir/modip.conf.default $modip_dir/modip.conf
    $run_command sed -i s/tsiapaliokas/modip/g $modip_dir/modip.conf

    $run_command make install
    $run_command make db-create-development
fi

$run_command make start
