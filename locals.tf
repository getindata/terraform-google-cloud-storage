locals {
  name_from_descriptor = trim(replace(
    lookup(module.this.descriptors, var.descriptor_name, module.this.id), "/${module.this.delimiter}${module.this.delimiter}+/", module.this.delimiter
  ), module.this.delimiter)
  encryption_enabled = module.this.enabled && var.encryption.enabled
  kms_key_name       = "${module.this.id}-key"
}
