## Задание 1
- [manifests/task1-deployment.yaml](manifests/task1-deployment.yaml)
- [manifests/task1-service.yaml](manifests/task1-service.yaml)
- [manifests/task1-client-pod.yaml](manifests/task1-client-pod.yaml)

### Ошибка при первом старте
Контейнер multitool конфликтовал по порту 80 с nginx (оба в одном network namespace пода).
![error](screenshots/task1-error.png)

### Исправление
Порт multitool переопределён через переменную HTTP_PORT=8080.  
![fixed](screenshots/task1-fixed.png)

### Поды до масштабирования
![before](screenshots/task1-before-scale.png)

### Поды после масштабирования (replicas=2)
![after](screenshots/task1-after-scale.png)

### Доступ из отдельного Pod через Service
![curl](screenshots/task1-curl.png)  


## Задание 2
- [manifests/task2-deployment.yaml](manifests/task2-deployment.yaml)
- [manifests/task2-service.yaml](manifests/task2-service.yaml)

### Под до создания Service
Init-контейнер busybox не может зарезолвить DNS-имя Service, nginx не стартует.
![before](screenshots/task2-before-svc.png)  
![logs-before](screenshots/task2-init-logs-before.png)  

### Под после создания Service
Init-контейнер успешно резолвит имя и завершается, основной контейнер nginx запускается.
![after](screenshots/task2-after-svc.png)
![logs-after](screenshots/task2-init-logs-after.png)