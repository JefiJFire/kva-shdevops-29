## Задание 1
- [manifests/deployment.yaml](manifests/deployment.yaml)
- [manifests/service-clusterip.yaml](manifests/service-clusterip.yaml)
- [manifests/test-pod.yaml](manifests/test-pod.yaml)

### Запуск и проверка Deployment
![get_pods](screenshots/task1-pods-running.png)

### Запуск и проверка Service-clusterip 
![get_svc](screenshots/task1-svc-clusterip.png)

### Проверка доступа curl'ом из тестового Pod'а
![curl_9001](screenshots/task1-curl9001-from-pod.png)  
![curl_9002](screenshots/task1-curl9002-from-pod.png)


## Задание 2
- [manifests/service-nodeport.yaml](manifests/service-nodeport.yaml)

### Запуск и проверка Service-nodeport
![get_svc](screenshots/task2-svc-nodeport.png)  

### Проверка доступа снаружи кластера
![curl_external](screenshots/task2-curl-external.png)