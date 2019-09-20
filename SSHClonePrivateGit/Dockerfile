FROM python:3.6-slim AS infrastructure

# Add metadata identifying these images as our build containers (can be used later for filtering)
LABEL stage=intermediate

#--no-install-recommends option is the slim option:
# https://askubuntu.com/questions/65081/what-are-the-implications-of-no-install-recommends-apt-get-install
RUN apt-get update && apt-get install -y --no-install-recommends \
	build-essential \
	gcc \
 	git \
 	openssh-client

###########################
FROM python:3.6-slim AS app

#Multi-stage build, the . . is because we have to specify dirs
COPY --from=infrastructure . .

ENV WORKDIR=/home/shay/cprint

# Take an SSH key as a build argument.
ARG SSH_PRIVATE_KEY

# 1. Fill SSH private key file from args.
# 2. Set the required permissions.
# 3. Check that agent exists
# 4. Familirize agent with the key
# 5. Add github.com as a known host
# 6. Clone the private repo using SSH
RUN echo "$SSH_PRIVATE_KEY" > id_rsa && \
	chmod -R 600 id_rsa && \
	eval $(ssh-agent) && \
    ssh-add id_rsa && \
    ssh-keyscan -H github.com >> /etc/ssh/ssh_known_hosts && \
    git clone ssh://git@github.com/shaybensasson/cprint.git $WORKDIR

WORKDIR $WORKDIR


#pip --user puts everything in /root/.local
# Make sure scripts in .local are usable:
ENV PATH=/root/.local/bin:$PATH

#https://pythonspeed.com/articles/multi-stage-docker-python/
RUN pip install --user -r requirements.txt

CMD ["python", "my_script.py"]
