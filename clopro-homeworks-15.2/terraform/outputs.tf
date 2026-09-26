output "picture_public_url" {
  value = local.picture_url
}

output "load_balancer_public_ip" {
  value = [
    for l in yandex_lb_network_load_balancer.web.listener : [
      for a in l.external_address_spec : a.address
    ]
  ][0][0]
}

output "instance_group_id" {
  value = yandex_compute_instance_group.web.id
}
