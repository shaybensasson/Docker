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


# Make sure scripts in .local are usable:
# ENV PATH=/root/.local/bin:$PATH

# # Add requirements.txt before rest of repo for caching
# # it must be before "ADD . <DEST>" line
# # https://www.aptible.com/documentation/deploy/tutorials/faq/dockerfile-caching/pip-dockerfile-caching.html
# ADD requirements.txt .

# #--user puts everything in /root/.local
# #https://pythonspeed.com/articles/multi-stage-docker-python/
# RUN pip install --user -r requirements.txt

# ###########################
# FROM python:3.6-slim AS app
# COPY --from=infrastructure /root/.local /root/.local

# ADD . /home/shay
# WORKDIR /home/shay

# CMD [ "python", "my_script.py" ]

# Take an SSH key as a build argument.
ARG SSH_PRIVATE_KEY

# 1. Create the SSH directory.
# 2. Populate the private key file.
# 3. Set the required permissions.
# 4. Add github to our list of known hosts for ssh.
# RUN mkdir -p /root/.ssh/ && \
#     echo "$SSH_PRIVATE_KEY" > /root/.ssh/id_rsa && \
#     chmod -R 600 /root/.ssh/ && \
#     ssh-keyscan -t rsa github.com >> /root/.ssh/known_hosts

# Clone the private repository
#RUN git clone ssh://git@github.com/shaybensasson/cprint.git

RUN echo "$SSH_PRIVATE_KEY" > id_rsa && \
	chmod -R 600 id_rsa && \
	eval $(ssh-agent) && \
    ssh-add id_rsa && \
    ssh-keyscan -H github.com >> /etc/ssh/ssh_known_hosts && \
    git clone ssh://git@github.com/shaybensasson/cprint.git

# Clone the private repository
#RUN git clone ssh://git@github.com/shaybensasson/cprint.git


# Make sure scripts in .local are usable:
ENV PATH=/root/.local/bin:$PATH

#--user puts everything in /root/.local
#https://pythonspeed.com/articles/multi-stage-docker-python/
RUN pip install --user -r cprint/requirements.txt

CMD ["python", "cprint/my_script.py"]
