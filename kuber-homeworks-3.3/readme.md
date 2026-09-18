## Задание 1. Создать сетевую политику или несколько политик для обеспечения доступа  
- [manifests/00-namespace.yaml](manifests/00-namespace.yaml)  
- [manifests/01-deployments.yaml](manifests/01-deployments.yaml)  
- [manifests/02-services.yaml](manifests/02-services.yaml)  
- [manifests/03-networkpolicies.yaml](manifests/03-networkpolicies.yaml)

### Вывод ```get pods```
![screenshots/get-pods.png](screenshots/get-pods.png)  

### Применение networkpolicies  
![screenshots/get-networkpolicy.png](screenshots/get-networkpolicy.png)  

### Проверка разрещающих правил  
![screenshots/curl-200.png](screenshots/curl-200.png)  

### Проверка запрещающих правил  
![screenshots/curl-timeout.png](screenshots/curl-timeout.png)
