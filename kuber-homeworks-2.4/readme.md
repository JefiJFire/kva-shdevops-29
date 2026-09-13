## Задание 1. Подготовка Helm-чарта
- [webapp/Chart.yaml](webapp/Chart.yaml)  
- [webapp/values.yaml](webapp/values.yaml)  
- [webapp/templates/_helpers.tpl](webapp/templates/_helpers.tpl)  
- [webapp/templates/frontend-deployment.yaml](webapp/templates/frontend-deployment.yaml)
- [webapp/templates/frontend-service.yaml](webapp/templates/frontend-service.yaml)
- [webapp/templates/backend-statefulset.yaml](webapp/templates/backend-statefulset.yaml)
- [webapp/templates/backend-service.yaml](webapp/templates/backend-service.yaml)

### Вывод ```helm lint```
![screenshots/task1-helm-lint.png](screenshots/task1-helm-lint.png)

## Задание 2. Запуск двух версий в разных namespace

### Вывод ```kubectl get ns```
![screenshots/task2-get-ns.png](screenshots/task2-get-ns.png)  

### Релиз версий  
![screenshots/task2-install-webapp.png](screenshots/task2-install-webapp.png)  

### Обновление релиза  
![screenshots/task2-upgrade-webapp.png](screenshots/task2-upgrade-webapp.png)  
![screenshots/task2-upgrade-history.png](screenshots/task2-upgrade-history.png)  

### Итоговый результат
![screenshots/task2-list.png](screenshots/task2-list.png)  
![screenshots/task2-get-all-app1.png](screenshots/task2-get-all-app1.png)  
![screenshots/task2-get-all-app2.png](screenshots/task2-get-all-app2.png)  

