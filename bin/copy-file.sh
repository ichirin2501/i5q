#!/bin/bash

cd $(dirname $0)
cd ..
# root

cp config/sysctl.conf /etc/sysctl.d/sysctl.conf
cp config/redis.conf /etc/redis/redis.conf
cp config/my.cnf /etc/mysql/conf.d/mysql.cnf
cp config/nginx.conf /etc/nginx/nginx.conf

#cp env.sh /home/isucon/env.sh
