resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/hosts.tftpl", {
    web_vms    = yandex_compute_instance.web,
    db_vms     = [for vm in yandex_compute_instance.db : vm],
    storage_vm = yandex_compute_instance.storage,
  })
  filename = "${path.module}/inventory.ini"
}