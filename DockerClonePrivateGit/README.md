# DockerClonePrivateGit
DockerClonePrivateGit

## Git cloning python code from a private git repo

```console
docker build --tag clone-private-git . --build-arg GIT_CREDS="$(cat ~/.git-credentials)";

docker run -it --rm clone-private-git
```

