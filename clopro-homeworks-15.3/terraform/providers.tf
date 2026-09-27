terraform {
  required_version = ">= 1.5.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.100.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}

provider "aws" {
  region = "ru-central1"

  access_key = yandex_iam_service_account_static_access_key.kms_sa_key.access_key
  secret_key = yandex_iam_service_account_static_access_key.kms_sa_key.secret_key

  skip_credentials_validation = true
  skip_region_validation      = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true

  endpoints {
    s3 = "https://storage.yandexcloud.net"
  }
}
