#!/bin/bash

set -ex

cd $(dirname $0)
cd ..
# root

#sudo sysctl -p
sudo ./bin/logrotate.sh
sudo systemctl restart nginx
#sudo service memcached restart
sudo systemctl restart mysql
echo 'sleep 3s'
sleep 3
sudo systemctl restart isuxi.perl.service
sleep 2
echo "init ok"
