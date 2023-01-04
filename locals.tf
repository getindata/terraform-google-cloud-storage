locals {
  enabled                    = module.this.enabled
  encrypt_gcs_bucket_tfstate = local.enabled && var.encrypt_gcs_bucket_tfstate
  bucket_enabled             = local.enabled && var.bucket_enabled
  bucket_name                = var.gcs_bucket_name != "" ? var.gcs_bucket_name : module.this.id
}
