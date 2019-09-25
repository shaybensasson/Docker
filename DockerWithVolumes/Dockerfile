FROM ubuntu

ENV name John Dow

#RUN useradd --create-home --shell /bin/bash cognitive

# ARG UID=1000
ENV USER="shay"
RUN useradd --create-home --shell /bin/bash $USER

#own its home dir
ENV USER_DIR=/home/$USER
ENV WORK_DIR=$USER_DIR/Homer
RUN chown -R $USER $USER_DIR

USER $USER

WORKDIR /docker-with-vols

ENTRYPOINT echo 'Hello' > 3.txt
