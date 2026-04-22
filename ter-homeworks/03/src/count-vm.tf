resource "yandex_compute_instance" "web" {
  count = var.vm_counts

  name = "web-${count.index + 1}"
  
  platform_id = var.vm_platform_id
  
  resources {
    cores  = var.vms_resources["web-0${count.index + 1}"].cores
    memory = var.vms_resources["web-0${count.index + 1}"].memory
    core_fraction = var.vms_resources["web-0${count.index + 1}"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.default.id
    }
  }

  scheduling_policy {
    preemptible = var.vm_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_nat
    security_group_ids = [yandex_vpc_security_group.example.id] 
  }

  #metadata = var.vm_metadata

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }

  zone = var.vm_zone

  depends_on = [ yandex_compute_instance.db ]
}