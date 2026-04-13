# vms_platform.tf

# Web VM variables
/*variable "vm_web_name" {
  type    = string
  default = "netology-develop-platform-web"
}*/

variable "vm_web_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "vm_web_platform_id" {
  type    = string
  default = "standard-v2"
}

/*variable "vm_web_cores" {
  type    = number
  default = 2
}

variable "vm_web_memory" {
  type    = number
  default = 1
}

variable "vm_web_core_fraction" {
  type    = number
  default = 5
}*/

variable "vm_web_preemptible" {
  type    = bool
  default = true
}

variable "vm_web_nat" {
  type    = bool
  default = true
}

variable "vm_web_serial_port_enable" {
  type    = number
  default = 1
}

variable "vm_web_image_family" {
  type    = string
  default = "ubuntu-2004-lts"
}

# DB VM variables
/*variable "vm_db_name" {
  type    = string
  default = "netology-develop-platform-db"
}*/

variable "vm_db_zone" {
  type    = string
  default = "ru-central1-b"
}

variable "vm_db_platform_id" {
  type    = string
  default = "standard-v2"
}

/*variable "vm_db_cores" {
  type    = number
  default = 2
}

variable "vm_db_memory" {
  type    = number
  default = 2
}

variable "vm_db_core_fraction" {
  type    = number
  default = 20
}*/

variable "vm_db_preemptible" {
  type    = bool
  default = true
}

variable "vm_db_nat" {
  type    = bool
  default = true
}

variable "vm_db_serial_port_enable" {
  type    = number
  default = 1
}

/*variable "vm_db_image_family" {
  type    = string
  default = "ubuntu-2004-lts"
}*/

variable "vm_db_default_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

variable "vm_metada" {
  type = map(string)
  default = {
    "serial-port-enable" = "1"
    ssh-keys             = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ8Y2STOsTvx9Q1tMvgF2ckbQFLGUWShlnwKR5nYXxe9"
  }
  
}