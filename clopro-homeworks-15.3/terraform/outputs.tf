output "kms_key_id" {
  value = yandex_kms_symmetric_key.bucket_key.id
}

output "encrypted_bucket" {
  value = var.bucket_name
}
