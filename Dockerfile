# set base image (host OS)
FROM python:3.10-slim

# set the working directory in the container
WORKDIR /home

# copy the dependencies file to the working directory
COPY requirements.txt .
COPY rabbitmq/consumer/consumer.py .

# install dependencies
RUN pip install  --root-user-action=ignore --upgrade pip
RUN pip install  --root-user-action=ignore -r requirements.txt
COPY . .

# copy the content of the local src directory to the working directory
COPY connector/ .

# command to run on container start
CMD [ "python", "./consumer.py" ]

# RUN pip install --upgrade pip

# RUN adduser -D myuser
# USER myuser
# WORKDIR /home/myuser

# COPY --chown=myuser:myuser requirements.txt requirements.txt
# RUN pip install --user -r requirements.txt

# ENV PATH="/home/myuser/.local/bin:${PATH}"

# COPY --chown=myuser:myuser . .
