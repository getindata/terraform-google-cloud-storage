/******************************************
  GCS Terraform State Bucket
*******************************************/

output "gcs_bucket_name" {
  description = "Bucket name."
  value       = google_storage_bucket.this[0].name
}
output "gcs_bucket_url" {
  description = "Bucket URL."
  value       = google_storage_bucket.this[0].url
}
output "gcs_bucket_id" {
  description = "Bucket ID."
  value       = google_storage_bucket.this[0].id
}
