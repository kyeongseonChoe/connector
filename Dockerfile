FROM python:3.10-slim

ENV PYTHONUNBUFFERED=1

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY rabbitmq/consumer .

EXPOSE 5000

CMD [ "python3","./consumer.py", "--port=5000"]
