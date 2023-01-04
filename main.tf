data "google_storage_project_service_account" "gcs_account" {
  project = var.project_id

}

module "kms" {
  count   = local.encrypt_gcs_bucket_tfstate ? 1 : 0
  source  = "terraform-google-modules/kms/google"
  version = "~> 2.1"

  project_id           = var.project_id
  location             = var.region
  keyring              = "${module.this.id}-keyring"
  keys                 = ["${module.this.id}-key"]
  key_rotation_period  = var.key_rotation_period
  key_protection_level = var.key_protection_level
  set_decrypters_for   = ["${module.this.id}-key"]
  set_encrypters_for   = ["${module.this.id}-key"]
  decrypters = [
    "serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}",
  ]
  encrypters = [
    "serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}",
  ]
  prevent_destroy = var.kms_prevent_destroy
}

resource "google_storage_bucket" "this" {
  count                       = local.bucket_enabled ? 1 : 0
  project                     = var.project_id
  name                        = local.bucket_name
  location                    = var.region
  labels                      = var.storage_bucket_labels
  force_destroy               = var.force_destroy
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }

  dynamic "encryption" {
    for_each = local.encrypt_gcs_bucket_tfstate ? ["encryption"] : []
    content {
      default_kms_key_name = module.kms[0].keys["${module.this.id}-key"]
    }
  }
}
