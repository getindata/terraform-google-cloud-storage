module "google_cloud_storage" {
  source  = "../../"
  context = module.this.context
  name = "test"
  project_id = "test_id"
}
