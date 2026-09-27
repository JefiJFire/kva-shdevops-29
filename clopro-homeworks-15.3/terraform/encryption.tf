resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = var.bucket_name

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = yandex_kms_symmetric_key.bucket_key.id
      sse_algorithm      = "aws:kms"
    }
  }

  depends_on = [
    yandex_kms_symmetric_key_iam_binding.kms_sa_key_access,
    yandex_iam_service_account_static_access_key.kms_sa_key,
  ]
}
