#!/bin/sh -xe

sudo docker container ls --format="{{.ID}}\t{{.Ports}}" | awk "{print $1}"
if [ ! -z "$container" ]
then
echo ${container}
sudo docker rm -f ${container}
fi

echo "running docker container on Port 8083"
sudo docker container run -d -p 8083:80 anchaljaindevops/applebite:latest
