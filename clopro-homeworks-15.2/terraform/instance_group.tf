# Сервисный аккаунт от имени которого Instance Group управляет ВМ
resource "yandex_iam_service_account" "ig_sa" {
  name = "instance-group-sa"
}

resource "yandex_resourcemanager_folder_iam_member" "ig_editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.ig_sa.id}"
}

locals {
  user_data = <<-EOT
    #cloud-config
    runcmd:
      - systemctl enable apache2
      - systemctl start apache2
      - |
        cat <<HTML > /var/www/html/index.html
        <!DOCTYPE html>
        <html>
        <head><title>LAMP Instance</title></head>
        <body>
          <h1>Hello from $(hostname)</h1>
          <img src="${local.picture_url}" alt="picture" width="400">
        </body>
        </html>
        HTML
  EOT
}

resource "yandex_compute_instance_group" "web" {
  name                = "lamp-web-group"
  folder_id           = var.folder_id
  service_account_id  = yandex_iam_service_account.ig_sa.id
  deletion_protection = false

  depends_on = [yandex_resourcemanager_folder_iam_member.ig_editor]

  instance_template {
    platform_id = "standard-v3"

    resources {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }

    boot_disk {
      initialize_params {
        image_id = var.lamp_image_id
        size     = 15
      }
    }

    network_interface {
      network_id = data.yandex_vpc_subnet.public.network_id
      subnet_ids = [data.yandex_vpc_subnet.public.id]
      nat        = true
    }

    metadata = {
      user-data = local.user_data
      ssh-keys  = "${var.vm_user}:${file(pathexpand(var.ssh_public_key_path))}"
    }

    scheduling_policy {
      preemptible = true
    }
  }

  scale_policy {
    fixed_scale {
      size = var.instance_count
    }
  }

  allocation_policy {
    zones = [var.default_zone]
  }

  deploy_policy {
    max_unavailable = 1
    max_creating    = 1
    max_expansion   = 1
    max_deleting    = 1
  }

  # Проверка состояния ВМ — health check по HTTP
  health_check {
    interval             = 5
    timeout               = 3
    healthy_threshold     = 2
    unhealthy_threshold   = 2

    http_options {
      port = 80
      path = "/"
    }
  }

  load_balancer {
    target_group_name = "lamp-web-tg"
  }
}
