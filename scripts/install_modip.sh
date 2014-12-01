#!/usr/bin/env bash

run_command="sudo -u modip"
modip_home=/var/lib/modip
modip_dir=$modip_home/modip

if [ ! -d $modip_dir ]; then
    $run_command git clone https://$username:$password@github.com/kokeroulis/modip $modip_home/modip
fi

cd $modip_dir

if [ ! -f $modip_dir/modip.conf ]; then
    $run_command cp $modip_dir/modip.conf.default $modip_dir/modip.conf
    $run_command sed -i s/tsiapaliokas/modip/g $modip_dir/modip.conf

    $run_command make install
fi

$run_command GOPATH=$modip_dir/.gopath go build modip.go
