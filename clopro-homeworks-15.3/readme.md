## Задание 1. KMS 
- [terraform/providers.tf](terraform/providers.tf)  
- [terraform/encryption.tf](terraform/encryption.tf)  
- [terraform/kms.tf](terraform/kms.tf)  
- [terraform/outputs.tf](terraform/outputs.tf)  
- [terraform/variables.tf](terraform/variables.tf)

### Провекра ключа через ```yc-cli``` и доступность через ```curl```
![screenshots/curl_and_yc_check.png](screenshots/curl_and_yc_check.png)  

### Скриншот из панели Yandex Cloud на применение ключа к Object Storage
![screenshots/yc_check_kms_key.png](screenshots/yc_check_kms_key.png)  

## Задание 2. SSL-сертификат через Lets Encrypt и подключение DNS-имени  

### Проверка сертификата  
![screenshots/dns_ssl_check.png](screenshots/dns_ssl_check.png)  

### Скриншоты из панели Yandex Cloud  
![screenshots/dns_bucket.png](screenshots/dns_bucket.png)  
![screenshots/dns_host.png](screenshots/dns_host.png)  
![screenshots/dns_ssl.png](screenshots/dns_ssl.png)  
![screenshots/dns_zone.png](screenshots/dns_zone.png)