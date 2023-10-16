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

variable "encryption" {
  description = "Kms variables"
  type = object({
    enabled              = optional(bool, false)
    key_protection_level = optional(string, "SOFTWARE")
    key_rotation_period  = optional(string)
    kms_prevent_destroy  = optional(bool, false)
  })
  default = {}
}

variable "force_destroy" {
  description = "If supplied, the state bucket will be deleted even while containing objects"
  type        = bool
  default     = false
}

variable "log_bucket" {
  description = "Specify bucket to store access log in"
  type        = string
  default     = null
}

variable "enforce_public_access_prevention" {
  description = "Prevents public access to a bucket. If set to false, the bucket uses public access prevention only if the bucket is subject to the public access prevention organization policy constraint"
  type        = bool
  default     = true
}
