variable "project_id" {
  description = "The default project to manage resources in"
  type        = string
}
variable "descriptor_name" {
  description = "Name of the descriptor used to form a resource name"
  default     = ""
  type        = string
}
variable "region" {
  description = "Region to create resources where applicable"
  type        = string
  default     = "europe-central2"
}

variable "encrypt_gcs_bucket_tfstate" {
  description = "Encrypt bucket used for storing terraform state files in seed project"
  type        = bool
  default     = true
}

variable "key_protection_level" {
  type        = string
  description = "The protection level to use when creating a version based on this template"
  default     = "SOFTWARE"
  validation {
    condition     = contains(["SOFTWARE", "HSM"], var.key_protection_level)
    error_message = "Invalid value provided. Allowed values: [\"SOFTWARE\", \"HSM\"]."
  }
}

variable "key_rotation_period" {
  description = "The rotation period of the key"
  type        = string
  default     = null
}

variable "kms_prevent_destroy" {
  description = "Set the prevent_destroy lifecycle attribute on keys"
  type        = bool
  default     = true
}

variable "storage_bucket_labels" {
  description = "Labels to apply to the storage bucket"
  type        = map(string)
  default     = {}
}

variable "force_destroy" {
  description = "If supplied, the state bucket will be deleted even while containing objects"
  type        = bool
  default     = false
}

variable "bucket_enabled" {
  type        = bool
  default     = true
  description = "Whether to create the GCS bucket"
}
variable "log_bucket" {
  type        = string
  default     = "mylogsbucket"
  description = "Specify bucket to store access log in"
}
