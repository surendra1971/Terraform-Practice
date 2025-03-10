# Root Module
terraform {
  backend "gcs" {
    bucket  = "my-terraform-state-bucket"
    prefix  = "terraform/state"
  }
}