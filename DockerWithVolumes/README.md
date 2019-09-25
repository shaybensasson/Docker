# DockerWithVolumes
DockerWithVolumes

## Docker With external Volumes


```console
DOCKER_BUILDKIT=1 docker build --tag docker-with-vols . && docker run -it --rm -v ~/Temp/docker-with-vols:/docker-with-vols --user $(id -u):$(id -g) docker-with-vols
```

* NOTE: `~/Temp/docker-with-vols` has to be created prior to docker run using this volume! Otherwise, we'd have security issues.

