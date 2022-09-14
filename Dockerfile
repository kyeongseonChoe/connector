# set base image (host OS)
FROM python:3.8

# set the working directory in the container
WORKDIR /home

# copy the dependencies file to the working directory
COPY requirements.txt .
COPY rabbitmq/consumer/consumer.py .

# install dependencies
RUN pip3 install -r requirements.txt


# copy the content of the local src directory to the working directory
COPY connector/ .

# command to run on container start
CMD [ "python", "./consumer.py" ]
