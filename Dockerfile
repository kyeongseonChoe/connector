# set base image (host OS)
FROM python:3.9

# set the working directory in the container
WORKDIR /home

# copy the dependencies file to the working directory
COPY requirements.txt .
COPY rabbitmq/consumer/consumer.py .

# install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY . .

# copy the content of the local src directory to the working directory
COPY connector/ .

# command to run on container start
CMD [ "python", "./consumer.py" ]
