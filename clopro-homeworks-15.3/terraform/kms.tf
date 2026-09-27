resource "yandex_kms_symmetric_key" "bucket_key" {
  name               = var.bucket_key_name
  default_algorithm  = var.encryption_algorithm
  rotation_period    = var.rotation_period
}

resource "yandex_iam_service_account" "kms_sa" {
  name = "bucket-kms-sa"
}

resource "yandex_resourcemanager_folder_iam_member" "kms_sa_storage_editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.kms_sa.id}"
}

resource "yandex_kms_symmetric_key_iam_binding" "kms_sa_key_access" {
  symmetric_key_id = yandex_kms_symmetric_key.bucket_key.id
  role              = "kms.keys.encrypterDecrypter"

  members = [
    "serviceAccount:${yandex_iam_service_account.kms_sa.id}",
  ]
}

resource "yandex_iam_service_account_static_access_key" "kms_sa_key" {
  service_account_id = yandex_iam_service_account.kms_sa.id
  description         = "static key for bucket encryption setup"

  depends_on = [yandex_resourcemanager_folder_iam_member.kms_sa_storage_editor]
}
