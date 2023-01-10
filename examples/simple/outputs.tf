output "gcs_bucket" {
  description = "Bucket used for storing state."
  value       = module.google_cloud_storage.gcs_bucket_name
}
output "gcs_bucket_id" {
  description = "Bucket ID."
  value       = module.google_cloud_storage.gcs_bucket_id
}
output "gcs_bucket_url" {
  description = "Bucket URL."
  value       = module.google_cloud_storage.gcs_bucket_url
}
