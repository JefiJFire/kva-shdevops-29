resource "yandex_compute_disk" "additional" {
  count = var.disk_counts

  name     = "disk-${count.index + 1}"
  zone     = var.default_zone
  folder_id = var.folder_id
  size     = 1
  type     = "network-hdd"
}

resource "yandex_compute_instance" "storage" {
  name        = "storage"
  zone        = var.default_zone
  platform_id = var.vm_platform_id
  folder_id   = var.folder_id

  resources {
    cores         = var.vms_resources["web-01"].cores
    memory        = var.vms_resources["web-01"].memory
    core_fraction = var.vms_resources["web-01"].core_fraction
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
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = false
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.additional[*].id
    content {
      disk_id = secondary_disk.value
    }
  }

  depends_on = [yandex_vpc_subnet.develop]
}