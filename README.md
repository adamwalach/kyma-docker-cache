
docker run -d -p 5000:5000 --restart always \
    --name registry \
    -v $PWD/config.yml:/etc/docker/registry.config.yml \
    -v $PWD/registry:/var/lib/registry \
    registry:2



docker images --format "{{.Repository}}:{{.Tag}}"
