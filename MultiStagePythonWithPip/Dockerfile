FROM python:3.6-slim AS infrastructure
RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential gcc

# Make sure scripts in .local are usable:
ENV PATH=/root/.local/bin:$PATH

# Add requirements.txt before rest of repo for caching
# it must be before "ADD . <DEST>" line
ADD requirements.txt .

RUN pip install --user -r requirements.txt

###########################
FROM python:3.6-slim AS app
COPY --from=infrastructure /root/.local /root/.local

ADD . /home/shay
WORKDIR /home/shay

CMD [ "python", "my_script.py" ]