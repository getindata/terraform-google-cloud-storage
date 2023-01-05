locals {
  name_from_descriptor = trim(replace(
  lookup(module.this.descriptors, var.descriptor_name, module.this.id), "/${module.this.delimiter}${module.this.delimiter}+/", module.this.delimiter
  ), module.this.delimiter)
  enabled                    = module.this.enabled
  encrypt_gcs_bucket_tfstate = local.enabled && var.encrypt_gcs_bucket_tfstate
  bucket_enabled             = local.enabled && var.bucket_enabled
  bucket_name                = var.gcs_bucket_name != "" ? var.gcs_bucket_name : module.this.id
}
