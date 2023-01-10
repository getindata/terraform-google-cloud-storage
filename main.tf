data "google_storage_project_service_account" "gcs_account" {
  project = var.project_id
}

module "kms" {
  count   = local.encryption_enabled ? 1 : 0
  source  = "terraform-google-modules/kms/google"
  version = "~> 2.1"

  project_id           = var.project_id
  location             = var.region
  keyring              = "${module.this.id}-keyring"
  keys                 = local.kms_key_name[*]
  key_rotation_period  = var.encryption.key_rotation_period
  key_protection_level = var.encryption.key_protection_level
  set_decrypters_for   = local.kms_key_name[*]
  set_encrypters_for   = local.kms_key_name[*]
  decrypters = [
    "serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}",
  ]
  encrypters = [
    "serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}",
  ]
  prevent_destroy = var.encryption.kms_prevent_destroy
}

resource "google_storage_bucket" "this" {
  count                       = module.this.enabled ? 1 : 0
  project                     = var.project_id
  name                        = local.name_from_descriptor
  location                    = var.region
  labels                      = { for k, v in module.this.tags : lower(k) => lower(v) }
  force_destroy               = var.force_destroy
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
  dynamic "logging" {
    for_each = var.log_bucket != null ? ["logging"] : []
    content {
      log_bucket = var.log_bucket
    }
  }
  dynamic "encryption" {
    for_each = var.encryption.enabled ? ["encryption"] : []
    content {
      default_kms_key_name = module.kms[0].keys[local.kms_key_name]
    }
  }
}
