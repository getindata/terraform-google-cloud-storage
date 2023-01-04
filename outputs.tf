/******************************************
  GCS Terraform State Bucket
*******************************************/

output "gcs_bucket_tfstate" {
  description = "Bucket used for storing terraform state for foundations pipelines in seed project."
  value       = one(google_storage_bucket.this).name
}
