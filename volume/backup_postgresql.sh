#!/usr/bin/env bash

sudo -u modip pg_dump modip_db > /root/volume/backup/$(date +"%d-%m-%Y-%H:%M").sql
