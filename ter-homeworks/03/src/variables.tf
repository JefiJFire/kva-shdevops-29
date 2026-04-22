###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

#VM variables

variable "vm_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "vm_platform_id" {
  type    = string
  default = "standard-v2"
}

variable "vm_preemptible" {
  type    = bool
  default = true
}

variable "vm_nat" {
  type    = bool
  default = true
}

variable "vm_serial_port_enable" {
  type    = number
  default = 1
}

variable "vm_image_family" {
  type    = string
  default = "ubuntu-2404-lts"
}

data "yandex_compute_image" "default" {
  family = var.vm_image_family
}

variable "vm_counts" {
  default = 2
}

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    web-01 = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    web-02 = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

variable "each_vm" {
  description = "Конфигурация DB"
  type = list(object({
    vm_name      = string
    cpu          = number
    ram          = number
    disk_volume  = number
    core_f       = number
    nat          = bool
  }))

  default = [
    {
      vm_name     = "main"
      cpu         = 4
      ram         = 4
      core_f      = 20
      disk_volume = 30
      nat = false
    },
    {
      vm_name     = "replica"
      cpu         = 2
      ram         = 2
      core_f      = 20
      disk_volume = 20
      nat = false
    }
  ]
}

variable "disk_counts" {
  default = 3
}

/*variable "vm_metadata" {
  type = map(string)
  default = {
    "serial-port-enable" = "1"
    ssh-keys             = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ8Y2STOsTvx9Q1tMvgF2ckbQFLGUWShlnwKR5nYXxe9"
  }
  
}*/

locals {
  ssh_public_key = file("~/.ssh/id_yc.pub")
}
