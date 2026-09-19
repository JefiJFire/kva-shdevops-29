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

variable "public_cidr" {
  type        = string
  description = "CIDR публичной подсети"
  default     = "192.168.10.0/24"
}

variable "private_cidr" {
  type        = string
  description = "CIDR приватной подсети"
  default     = "192.168.20.0/24"
}

variable "nat_instance_ip" {
  type        = string
  description = "Внутренний адрес NAT-инстанса"
  default     = "192.168.10.254"
}

variable "nat_instance_image_id" {
  type        = string
  description = "Образ NAT-инстанса из задания"
  default     = "fd80mrhj8fl2oe87o4e1"
}

variable "vm_user" {
  type        = string
  description = "Имя пользователя на ВМ"
  default     = "ubuntu"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Путь к публичному SSH-ключу"
  default     = "~/.ssh/id_ed25519.pub"
}
