# DockerWithVolumes

## External volume snippet
* It turn out there is a major unsolved problem with dockers with non root users and volumes bound to host dir:
https://github.com/moby/moby/issues/2259

* So here a simple workaround `docker command` (*that was tested on linux Uni workstations*):
``` shell script
rm -rf /tmp/www && \
mkdir /tmp/www && \
chown $(id -u):$(id -g) /tmp/www && \
docker run -v /tmp/www:/var/www ubuntu touch /var/www/1.log

sudo chown -R $(id -u):$(id -g) /tmp/www && ll /tmp/www

# NOTE: the user and group are not `root`
```
* Yet, this is not optimal because it requires the `sudo chown` post script.

## Docker With external Volumes
Here are my attempts of using this `docker command` on a docker (*were tested on linux Uni workstations*):
```shell script
DOCKER_BUILDKIT=1 docker build --tag docker-with-vols . && docker run -it --rm -v /tmp/docker-with-vols:/docker-with-vols docker-with-vols 1 2 3

sudo chown -R $(id -u):$(id -g) /tmp/docker-with-vols && ll /tmp/docker-with-vols
```

* NOTE: `/tmp/docker-with-vols` will be created, if needed by the container.

## More
```shell script
rm -rf /tmp/docker-with-vols && mkdir /tmp/docker-with-vols
```

## pre-scripts for Uni satelite stations:
```shell script
mkdir -p /home/cognitive/Projects/Docker/

rsync -ahvr --progress shay@132.72.66.181:/home/shay/Projects/Docker/ /home/cognitive/Projects/Docker/

cd ~/Projects/Docker/DockerWithVolumes
```

