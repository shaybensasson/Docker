FROM python:3.6-slim AS infrastructure

#--no-install-recommends option is the slim option:
# https://askubuntu.com/questions/65081/what-are-the-implications-of-no-install-recommends-apt-get-install
RUN apt-get update && apt-get install -y --no-install-recommends \
	build-essential \
	gcc \ 
 	git


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

# ARG SSH_PRIVATE_KEY
ARG GIT_CREDS

# RUN echo "Oh dang look at that $SSH_PRIVATE_KEY"

RUN git config --global user.name "Shay Ben-Sasson"
RUN git config --global user.email "shaybensasson@gmail.com"
RUN git config --global credential.helper store
RUN echo $GIT_CREDS > /root/.git-credentials

RUN git clone https://github.com/shaybensasson/cprint.git


# Make sure scripts in .local are usable:
ENV PATH=/root/.local/bin:$PATH

#--user puts everything in /root/.local
#https://pythonspeed.com/articles/multi-stage-docker-python/
RUN pip install --user -r cprint/requirements.txt

CMD ["python", "cprint/my_script.py"]