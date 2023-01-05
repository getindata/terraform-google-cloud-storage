output "gcs_bucket" {
  description = "Bucket used for storing state."
  value       = one(google_storage_bucket.this).name
}