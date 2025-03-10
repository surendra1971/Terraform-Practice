module "storage" {
  source     = "./modules/storage"
  project_id = var.project_id
  region     = var.region
  bucket_name = "web-app-static-assets"
}

resource "google_storage_bucket" "static" {
  name          = var.bucket_name
  location      = var.region
  storage_class = "STANDARD"
}
