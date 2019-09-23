FROM python:3.6-slim AS infrastructure

#https://stackoverflow.com/a/27703359/1640414
#creates user and adds home dir
RUN useradd --create-home --shell /bin/bash shay
#set as active user
USER shay

WORKDIR $HOME/cprint

#WORKDIR /home/shay/cprint

#make sure ~ points to /home/shay
#ENV HOME="/home/shay"

# #pip --user puts everything in /root/.local
# # Make sure scripts in .local are usable:
# ENV PATH=/root/.local/bin:$PATH

# #https://pythonspeed.com/articles/multi-stage-docker-python/
# RUN pip install --user -r requirements.txt

COPY . .

# RUN export HOME=/home/shay

CMD ["python", "my_script.py"]
