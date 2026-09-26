## Задание 1. Yandex Cloud 
- [terraform/providers.tf](terraform/providers.tf)  
- [terraform/loadbalancer.tf](terraform/loadbalancer.tf)  
- [terraform/storage.tf](terraform/storage.tf)  
- [terraform/outputs.tf](terraform/outputs.tf)  
- [terraform/instance_group.tf](terraform/instance_group.tf)  
- [terraform/data.tf](terraform/data.tf)  
- [terraform/variables.tf](terraform/variables.tf)

### Вывод ```curl``` для picture_public_url
![screenshots/curl_picture_public_url.png](screenshots/curl_picture_public_url.png)  

### Вывод ```curl``` для load_balancer_public_ip
![screenshots/curl_load_balancer_public_ip.png](screenshots/curl_load_balancer_public_ip.png)  

### Вывод ```curl``` для проверки балансировки
![screenshots/curl_for.png](screenshots/curl_for.png)  

### Вывод ```curl``` в момент удаления одной из ВМ  
![screenshots/destroy_vm_and_check_balancer.png](screenshots/destroy_vm_and_check_balancer.png)

### Скриншоты из панели Yandex Cloud  
![screenshots/vm_running_status.png](screenshots/vm_running_status.png)  
![screenshots/load_balancer_running_status.png](screenshots/load_balancer_running_status.png)  

### Скриншот историй операций с ВМ  
![screenshots/vm_history_autocreate.png](screenshots/vm_history_autocreate.png)
