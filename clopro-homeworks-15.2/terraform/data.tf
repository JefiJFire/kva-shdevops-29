data "yandex_vpc_subnet" "public" {
  name = var.public_subnet_name
}

data "yandex_client_config" "client" {}
