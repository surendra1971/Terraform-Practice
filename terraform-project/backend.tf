# Root Module
# terraform {
#   backend "gcs" {
#     bucket  = "my-terraform-state-bucket"
#     prefix  = "terraform/state"
#   }
# }

# terraform {
#   backend "s3" {
#     bucket = "my-aws-terraform-state"
#     key    = "terraform/state"
#     region = "us-east-1"
#   }
# }

# provider "aws" {
#   region = var.region
# }