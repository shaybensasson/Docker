# CmdVsRunVsEntrypoint
CmdVsRunVsEntrypoint

## Cmd Vs Run Vs Entrypoint
https://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/


```console
DOCKER_BUILDKIT=1 docker build --tag cmd-run-entrypoint . && docker run -it --rm cmd-run-entrypoint

DOCKER_BUILDKIT=1 docker build --tag cmd-run-entrypoint . && docker run -it --rm cmd-run-entrypoint 123

DOCKER_BUILDKIT=1 docker build --tag cmd-run-entrypoint . && docker run -it --rm cmd-run-entrypoint /bin/bash
```

