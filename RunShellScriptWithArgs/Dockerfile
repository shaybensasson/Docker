FROM python:3.6-slim
WORKDIR /home/shay

COPY ./file.sh /
RUN chmod 755 /file.sh


ENTRYPOINT ["/file.sh"]
