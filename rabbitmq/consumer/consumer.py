import pika
#import Kafka.configuration.config as kafka
#import rabbitmq.configuration.config as rabbitmq
from kafka import KafkaProducer
from json import dumps

class Consumer:
    QUEUE = "QUEUE 1"
    TOPIC = "2u.driver.app.location"
    
    def __init__(self):
        self.__url= '52.78.190.155'
        self.__port = 31538
        self.__vhost =  '/'
        self.__cred = pika.PlainCredentials(username='test', password='1234');
        self.__queue = Consumer.QUEUE
        return

    def on_message(channel, method_frame, header_frame, body):
        print('Received  %s' % body)
        
        producer = KafkaProducer(
            #acks=0, 
            #compression_type='gzip',
            bootstrap_servers=['52.78.190.155:31090'],
            #value_serializer=lambda x: dumps(x).encode('utf-8')
        )
        producer.send(Consumer.TOPIC, body)
        producer.flush()
        return

    def main(self):
        conn = pika.BlockingConnection(pika.ConnectionParameters(host=self.__url, port=self.__port, virtual_host=self.__vhost, credentials=self.__cred))
        chan = conn.channel()
        chan.basic_consume(
            queue = self.__queue, 
            on_message_callback = Consumer.on_message,
            auto_ack = True
        )
        print('Consumer is starting...')
        chan.start_consuming()
        return

consumer = Consumer()
consumer.main()

# test3
