#!/bin/sh

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo $DIR

#docker rm -f $(docker ps -a)
docker rm -f rbac-web
docker rm -f rbac-mongo
docker rm -f rbac-mysql
# docker rm -f rbac-oracle
docker-compose rm

# docker-compose build rbac-oracle
# docker-compose up -d rbac-oracle

#create container
docker-compose build rbac-mysql
docker-compose up -d rbac-mysql

docker-compose build rbac-mongo
docker-compose up -d rbac-mongo

docker-compose build rbac-web
docker-compose up -d rbac-web

sleep 10
docker exec -it rbac-mongo sh /start_script.sh
docker exec -it rbac-web chmod 777 -R  ./storage/
docker exec -it rbac-mysql sh /start_script.sh

# Laravel
chmod -R 777 $DIR/../storage
