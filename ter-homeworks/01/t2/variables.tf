# variables.tf

variable "mysql_database" {
    description = "Имя базы данных, которую создаст MySQL"
    type        = string
    default     = "app_db"
}

variable "mysql_user" {
    description = "Имя пользователя для подключения к БД"
    type        = string
    default     = "app_user"
}

variable "host_ip" {
    description = "IP-адрес удаленного хоста"
    type = string
}

variable "ssh_key" {
    description = "Путь до SSH-ключа"
    type = string
}