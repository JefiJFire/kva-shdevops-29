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

variable "bucket_name" {
  type        = string
  description = "Имя существующего бакета Object Storage из terraform-lb"
}

variable "bucket_key_name" {
  type        = string
  description = "Ключ для шифрования содержимого бакета Object Storage"
  default     = "bucket-encryption-key"
  }

variable "encryption_algorithm" {
  type        = string
  description = "Тип шифрования"
  default     = "AES_256"
}

variable "rotation_period" {
  type        = string
  description = "Время ротации ключа"
  default     = "8760h" # 1 год
}