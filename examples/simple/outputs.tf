output "gcs_bucket" {
  description = "Bucket used for storing state."
  value       = google_storage_bucket.this.name
}
