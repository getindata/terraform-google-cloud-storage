output "gcs_bucket" {
  description = "Bucket used for storing state."
  value       = module.google_cloud_storage.gcs_bucket
}
