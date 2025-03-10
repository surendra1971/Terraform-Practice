# provider "google" {
#   project = var.project_id
#   region  = var.region
# }

terraform {
  backend "s3" {
    bucket = "my-aws-terraform-state"
    key    = "terraform/state"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}