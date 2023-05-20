sudo docker container ls --format="{{.ID}}\t{{.Ports}}" | awk "{print $1}"
if [ ! -z "$container" ]
then
sudo docker rm -f ${container}
fi
sudo docker container run -d -p 8083:80 anchaljaindevops/applebite:latest
