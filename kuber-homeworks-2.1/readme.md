## Задание 1
- [manifests/task1-containers-data-exchange.yaml](manifests/task1-containers-data-exchange.yaml)

###  Describe pod со статусом контейнеров
![describe_pod](screenshots/task1-decribe-pod.png)

### Вывод ```tail -f```
![tail_-f](screenshots/task1-tail-f.png)

## Задание 2
- [manifests/task2-pv-pvc.yaml](manifests/task2-pv-pvc.yaml)

### Статус PV и PVC
![pv_pvc_bound](screenshots/task2-pv-pvc-bound.png)  

### Вывод ```tail -f```
![tail_-f](screenshots/task2-tail-f.png)  

### Describe pv со статус Released
![descrive_pv](screenshots/task2-describe-pv.png)  

### Состояние файла до и после удаления PV
![before_pv_delete](screenshots/task2-before-pv-delete.png)  
![after_pv_delete](screenshots/task2-after-pv-delete.png)  

Пояснение: Удаление объекта ```PersistentVolume``` в Kubernetes — это удаление только API-объекта-описания, метаданных о томе в etcd кластера. Ресурс ```hostPath``` не подразумевает никакого провизионера (kubernetes.io/no-provisioner/встроенный hostPath плагин), который бы физически чистил диск при удалении PV. Реальные файлы на файловой системе ноды остаются нетронутыми — Kubernetes про них просто «забывает» на уровне API, но с диском ничего не делает. Чтобы удалить данные, администратору нужно вручную зайти на ноду и стереть директорию.


## Задание 3
- [manifests/task3-sc.yaml](manifests/task3-sc.yaml)

### Get storageclass / pv / pvc
![get-storageclass-pv-pvc](screenshots/task3-get-storageclass-pv-pvc.png)

### Вывод ```tail -f```
![tail_-f](screenshots/task3-tail-f.png)