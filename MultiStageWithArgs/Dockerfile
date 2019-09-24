FROM python:3.6-slim AS infrastructure
RUN apt-get update && apt-get install -y --no-install-recommends \
 	libgomp1
# 	openssh-client \
# 	git

#libgomp1 is required by lightgbm

#	build-essential \
#	gcc \

###########################
FROM python:3.6-slim AS app
COPY --from=infrastructure . .

#NOTE: user does not persist thru stages
#https://stackoverflow.com/a/27703359/1640414
#creates user and adds home dir
RUN useradd --create-home --shell /bin/bash shay

#own its home dir
ENV WORKDIR=/home/shay
RUN chown -R shay /home/shay

WORKDIR $WORKDIR

#add the code and set permissions
# (before adding the user)
ADD . .
RUN chmod 755 entrypoint.sh

#set as active user
USER shay

# Make sure scripts in .local are usable:
ENV PATH=$WORKDIR/.local/bin:$PATH

#--user puts everything in /root/.local
#https://pythonspeed.com/articles/multi-stage-docker-python/
RUN pip install --user -r requirements.txt

# passings args to entropy point
# https://stackoverflow.com/a/53897608/1640414
ENTRYPOINT ["/bin/bash", "-c", "./entrypoint.sh \"$@\"", "--"]
