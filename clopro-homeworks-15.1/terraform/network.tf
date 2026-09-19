# 1. Пустая VPC
resource "yandex_vpc_network" "main" {
  name = "netology-vpc"
}

# 2. Публичная подсеть (маршрут в интернет — по умолчанию, через NAT 1:1 у ВМ)
resource "yandex_vpc_subnet" "public" {
  name           = "public"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = [var.public_cidr]
}

# 3. Таблица маршрутизации: весь исходящий трафик private -> NAT-инстанс
resource "yandex_vpc_route_table" "private" {
  name       = "private-via-nat"
  network_id = yandex_vpc_network.main.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = var.nat_instance_ip
  }
}

# 4. Приватная подсеть с привязанной таблицей маршрутов
resource "yandex_vpc_subnet" "private" {
  name           = "private"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = [var.private_cidr]
  route_table_id = yandex_vpc_route_table.private.id
}
