variable "project_id" {
  description = "The default project to manage resources in"
  type        = string
}
variable "descriptor_name" {
  description = "Name of the descriptor used to form a resource name"
  type        = string
  default     = "gcp-bucket"
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
  description = "The protection level to use when creating a version based on this template"
  type        = string
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

variable "force_destroy" {
  description = "If supplied, the state bucket will be deleted even while containing objects"
  type        = bool
  default     = false
}

variable "log_bucket" {
  description = "Specify bucket to store access log in"
  type        = string
  default     = "mylogsbucket"
}
