FROM python:3.10-slim

ENV PYTHONUNBUFFERED=1

COPY requirements.txt requirements.txt

#RUN pip install -r --default-timeout=100 requirements.txt
RUN sudo pip install --default-timeout=100 pika
RUN sudo pip install --default-timeout=100 kafka-python

COPY rabbitmq/consumer .

EXPOSE 5000

CMD [ "python3","./consumer.py", "--port=5000"]
