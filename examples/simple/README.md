# Simple Example
## Usage
```
module "google_cloud_storage" {
  name       = "test"
  project_id = "test_id"
}

terraform init
terraform plan -out tfplan
terraform apply tfplan
```
