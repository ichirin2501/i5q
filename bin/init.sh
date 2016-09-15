#!/bin/bash

set -ex

cd $(dirname $0)
cd ..
# root

#sudo sysctl -p
sudo ./bin/logrotate.sh
sudo service nginx restart
#sudo service memcached restart
#sudo service mysql restart
echo 'sleep 3s'
sleep 3
sudo systemctl reload isuxi.perl.service
sleep 2
echo "init ok"
