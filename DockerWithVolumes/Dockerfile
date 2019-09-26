FROM python:3.6-slim

# WORKDIR $WORK_DIR
WORKDIR /workdir

# Make sure scripts in .local are usable:
ENV PATH=/root/.local/bin:$PATH

#add the code and set permissions
ADD . .
RUN chmod 755 entrypoint.sh

RUN pip install tqdm --user

# ENTRYPOINT [ "python", "my_script.py" ]

# passings args to the entry point
# https://stackoverflow.com/a/53897608/1640414
ENTRYPOINT ["/bin/bash", "-c", "./entrypoint.sh \"$@\"", "--"]
# CMD []

# ENTRYPOINT ["cat", "./entrypoint.sh"]
# CMD []
