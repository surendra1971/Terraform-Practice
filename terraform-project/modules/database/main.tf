module "database" {
  source     = "./modules/database"
  project_id = var.project_id
  region     = var.region
  db_name    = "web-db-instance"
}

### main.tf
resource "google_sql_database_instance" "db" {
  name             = var.db_name
  database_version = "POSTGRES_14"
  region           = var.region
  settings {
    tier = "db-f1-micro"
  }
}