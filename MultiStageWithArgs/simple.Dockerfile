#docker build --tag multi-stage-with-args --file simple.Dockerfile . && docker run -it --rm multi-stage-with-args ABC

FROM python:3.6-slim AS infrastructure
COPY . .

FROM python:3.6-slim AS app
COPY --from=infrastructure . .

#RUN chmod 755 /file.sh
#ENTRYPOINT ["/file.sh"]

ENTRYPOINT ["python", "my_script.py"]
CMD []
