FROM python:3.10

ENV PYTHONUNBUFFERED=1

COPY requirements.txt requirements.txt

#RUN pip install -r --default-timeout=100 requirements.txt
RUN apt-get update && apt-get install python3-pip
RUN pip install pika
RUN pip install kafka-python

COPY rabbitmq/consumer .

EXPOSE 5000 

CMD [ "python","./consumer.py", "--port=5000"]
