#!/bin/bash
set -ex

# nginx
if [ -e /var/log/nginx/isucon.access_log.tsv ]; then
  mv /var/log/nginx/isucon.access_log.tsv /var/log/nginx/isucon.access_log.tsv.$(date "+%Y%m%d_%H%M%S")
fi

# mysql
if [ -e /var/lib/mysql/mysqld-slow.log ]; then
  mv /var/lib/mysql/mysqld-slow.log /var/lib/mysql/mysqld-slow.log.$(date "+%Y%m%d_%H%M%S")
fi
