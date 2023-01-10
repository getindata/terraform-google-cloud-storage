module "google_cloud_storage" {
  source     = "../../"
  context    = module.this.context
  name       = "gcp-storage"
  project_id = "project-id"
}
