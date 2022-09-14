FROM python:3.10-slim

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1 

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY rabbitmq/consumer .

EXPOSE 5000

CMD [ "python3","./consumer.py", "--port=5000"]
