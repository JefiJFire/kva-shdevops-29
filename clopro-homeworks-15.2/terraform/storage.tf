# Сервисный аккаунт для работы Object Storage (статические ключи)
resource "yandex_iam_service_account" "storage_sa" {
  name = "storage-editor-sa"
}

resource "yandex_resourcemanager_folder_iam_member" "storage_editor" {
  folder_id = var.folder_id
  role      = "storage.admin"
  member    = "serviceAccount:${yandex_iam_service_account.storage_sa.id}"
}

resource "yandex_iam_service_account_static_access_key" "storage_sa_key" {
  service_account_id = yandex_iam_service_account.storage_sa.id
  description         = "static key for object storage"
}

resource "yandex_storage_bucket" "images" {
  access_key = yandex_iam_service_account_static_access_key.storage_sa_key.access_key
  secret_key = yandex_iam_service_account_static_access_key.storage_sa_key.secret_key
  bucket     = var.bucket_name

  # Бакет и объект должны быть доступны из интернета на чтение
  acl = "public-read"

  depends_on = [yandex_resourcemanager_folder_iam_member.storage_editor]
}

resource "yandex_storage_object" "picture" {
  access_key = yandex_iam_service_account_static_access_key.storage_sa_key.access_key
  secret_key = yandex_iam_service_account_static_access_key.storage_sa_key.secret_key
  bucket     = yandex_storage_bucket.images.bucket
  key        = "picture.jpg"
  source     = var.image_file
  acl        = "public-read"

  depends_on = [yandex_resourcemanager_folder_iam_member.storage_editor]
}

locals {
  picture_url = "https://storage.yandexcloud.net/${yandex_storage_bucket.images.bucket}/${yandex_storage_object.picture.key}"
}
