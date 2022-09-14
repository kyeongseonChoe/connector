FROM python:3.10

ENV PYTHONUNBUFFERED=1
ENV http_proxy http://proxy-chain.xxx.com:911/ 781
ENV https_proxy http://proxy-chain.xxx.com:912/ 176

COPY requirements.txt requirements.txt

#RUN pip install -r --default-timeout=100 requirements.txt
#RUN apt-get update && apt-get install python3-pip
# RUN pip install pika
# RUN pip install kafka-python
# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

COPY rabbitmq/consumer .

EXPOSE 5000 

CMD [ "python","./consumer.py", "--port=5000"]
