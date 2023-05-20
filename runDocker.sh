#!/bin/sh -xe

PORT=8083
container=$(sudo docker container ls --format="{{.ID}}\t{{.Ports}}" | grep ${PORT} | awk '{print $1}')
echo "container id is :$container"

if [[ ! -z $container ]]
then
sudo docker rm -f ${container}
fi

echo "running docker container on Port 8083"
sudo docker container run -d -p $PORT:80 anchaljaindevops/applebite:latest
