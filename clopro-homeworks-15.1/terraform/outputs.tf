output "nat_instance_internal_ip" {
  value = yandex_compute_instance.nat.network_interface[0].ip_address
}

output "nat_instance_public_ip" {
  value = yandex_compute_instance.nat.network_interface[0].nat_ip_address
}

output "public_vm_public_ip" {
  value = yandex_compute_instance.public_vm.network_interface[0].nat_ip_address
}

output "public_vm_internal_ip" {
  value = yandex_compute_instance.public_vm.network_interface[0].ip_address
}

output "private_vm_internal_ip" {
  value = yandex_compute_instance.private_vm.network_interface[0].ip_address
}

output "ssh_to_public_vm" {
  value = "ssh -A ${var.vm_user}@${yandex_compute_instance.public_vm.network_interface[0].nat_ip_address}"
}

output "ssh_to_private_vm" {
  value = "ssh -J ${var.vm_user}@${yandex_compute_instance.public_vm.network_interface[0].nat_ip_address} ${var.vm_user}@${yandex_compute_instance.private_vm.network_interface[0].ip_address}"
}
