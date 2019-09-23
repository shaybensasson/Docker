FROM python:3.6-slim AS infrastructure
RUN apt-get update && apt-get install -y --no-install-recommends \
 	git
# 	openssh-client \
# 	libgomp1

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
RUN chown -R shay /home/shay

#set as active user
USER shay

WORKDIR /home/shay

# Make sure scripts in .local are usable:
ENV PATH=/home/shay/.local/bin:$PATH

# Add requirements.txt before rest of repo for caching
# it must be before "ADD . <DEST>" line
# https://www.aptible.com/documentation/deploy/tutorials/faq/dockerfile-caching/pip-dockerfile-caching.html
ADD requirements.txt .

#--user puts everything in /root/.local
#https://pythonspeed.com/articles/multi-stage-docker-python/
RUN pip install --user -r requirements.txt

#add the code
ADD . .

# passings args to entropy point
# https://stackoverflow.com/a/53897608/1640414
ENTRYPOINT ["python", "my_script.py"]
CMD []