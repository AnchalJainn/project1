#!/bin/sh -xe

container=$(sudo docker container ls --format="{{.ID}}\t{{.Ports}}" | awk "{print $1}")
echo $container

if [[ ! -z $container ]]
then
echo ${container}
sudo docker rm -f ${container}
fi

echo "running docker container on Port 8083"
sudo docker container run -d -p 8083:80 anchaljaindevops/applebite:latest
