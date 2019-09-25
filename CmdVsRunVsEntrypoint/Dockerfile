#for the comments we assume run args/command are: 123
#Very helpful post: https://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/

FROM ubuntu

ENV name John Dow

#Shell form:
#   It calls /bin/sh -c <command> under the hood and normal shell processing happens
# ENTRYPOINT echo "Hello, $name"


#Note that any command line args of the docker run are discarded
#result: Hello, John Dow

#Exec form (recommanded):
#   It calls executable directly, and shell processing does not happen
# ENTRYPOINT ["/bin/echo", "Hello, $name"]

#result: Hello, $name 123
#Note that variable name is not substituted.
#Note that any command line args of the docker run are concate as suffix

# -------
# RUN:
# -------
# It executes any commands on top of the current image and creates a new layer by committing the results

#A good illustration of RUN instruction would be to install multiple version control systems packages, using apt-get update and install

RUN apt-get update && apt-get install --no-install-recommends \
    libgomp1



# -------
# CMD:
# -------
# CMD instruction allows you to set a default command, which will be executed only when you run container without specifying a command

# CMD echo "Hello world"

#Note: if args/command are passed, the cmd will be ignored!
# e.g. try passing /bin/bash as args/command
#Note: only last cmd is used

#Another form of CMD is specifying parameters for entrypoint, see ENTRYPOINT section


# -----------
# ENTRYPOINT:
# -----------
# ENTRYPOINT instruction allows you to configure a container that will run as an executable, and won't be discarded as CMD if additional args/command are specified during `docker run`.

#Exec form (of ENTRYPOINT)
ENTRYPOINT ["/bin/echo", "Hello"]
# CMD ["world"]

#result (no args): Hello world
#result (with 123 as args): Hello 123

#Shell form (of ENTRYPOINT):
# ignores any CMD or docker run command line arguments.
# ENTRYPOINT echo 'Hello'
# CMD ["world"]

#result (no args): Hello
#result (with 123 as args): Hello
