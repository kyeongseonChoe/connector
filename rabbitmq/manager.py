import schedule
import time
import requests
import json


# 5초에 한번씩 rabbitmq의 생성된 queue를 확인하여 추가/삭제 되었을 경우 rabbitmq의 listener 업데이트
queues = set()
tmp_list = list()  
def job():
    
    res = requests.get("http://52.78.190.155:30322/api/queues",auth=requests.auth.HTTPBasicAuth(username="test", password="1234"))
    response_dict = json.loads(res.text)
    
    for tmp in response_dict: tmp_list.append(tmp["name"])
    
    # 새로운 queue가 생겼을 경우
    for res in tmp_list:
        if(res not in queues):
            queues.add(res)
    
    # 기존 queue가 삭제 되었을 경우
    for queue in queues.copy():
        if(queue not in tmp_list):
            queues.remove(queue)
            break
            
    #print(queues)
    tmp_list.clear()
    
schedule.every(5).seconds.do(job)

while True:
    schedule.run_pending()
    time.sleep(1)