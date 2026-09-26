variable "token" {
  type        = string
  description = "IAM-токен Yandex Cloud (или задать через YC_TOKEN)"
  default     = null
  sensitive   = true
}

variable "cloud_id" {
  type        = string
  description = "ID облака"
}

variable "folder_id" {
  type        = string
  description = "ID каталога"
}

variable "default_zone" {
  type        = string
  description = "Зона доступности"
  default     = "ru-central1-a"
}

# Публичная подсеть создана в предыдущем ДЗ ("Организация сети").
# Ищем её по имени, чтобы не пересоздавать сеть заново.
variable "public_subnet_name" {
  type        = string
  description = "Имя публичной подсети из предыдущего ДЗ"
  default     = "public"
}

variable "bucket_name" {
  type        = string
  description = "Имя бакета Object Storage (должно быть глобально уникальным)"
  default     = "kva-shdevops-29-lb-hw"
}

variable "image_file" {
  type        = string
  description = "Путь к локальному файлу картинки для бакета"
  default     = "./files/picture.jpg"
}

variable "lamp_image_id" {
  type        = string
  description = "Образ LAMP из задания"
  default     = "fd827b91d99psvq5fjit"
}

variable "instance_count" {
  type        = number
  description = "Количество ВМ в Instance Group"
  default     = 3
}

variable "vm_user" {
  type        = string
  description = "Имя пользователя на ВМ"
  default     = "ubuntu"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Путь к публичному SSH-ключу"
  default     = "~/.ssh/id_yc.pub"
}
