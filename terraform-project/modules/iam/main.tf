module "iam" {
  source     = "./modules/iam"
  project_id = var.project_id
}

resource "google_project_iam_binding" "admin" {
  project = var.project_id
  role    = "roles/editor"
  members = ["user:admin@example.com"]
}
