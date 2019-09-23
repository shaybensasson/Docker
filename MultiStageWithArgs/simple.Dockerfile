#docker build --tag multi-stage-with-args --file simple.Dockerfile . && docker run -it --rm multi-stage-with-args ABC
#https://stackoverflow.com/a/53897608/1640414

FROM python:3.6-slim AS infrastructure
COPY . .

FROM python:3.6-slim AS app
COPY --from=infrastructure . .

#RUN chmod 755 /file.sh
#ENTRYPOINT ["/file.sh"]

#https://stackoverflow.com/a/53897608/1640414
ENTRYPOINT ["python", "my_script.py"]
CMD []
