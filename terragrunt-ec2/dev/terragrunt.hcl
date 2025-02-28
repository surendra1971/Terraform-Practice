terraform {
  source = "terraform-aws-modules/ec2-instance/aws//?ref=v4.0.0"
}

locals {
  env_vars = yamldecode(
    file("${find_in_parent_folders("common-environment.yaml")}")
  )
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  profile                 = "default"
  region                  = "eu-central-1"
  shared_credentials_file = "~/.aws/credentials"
}
EOF
}

inputs = {
  ami           = "ami-0b9dfa0ef0653492f"
  instance_type = local.env_vars.instance_type  # Fixed reference
  tags = {
    Name = "Terragrunt Tutorial: EC2"
  }
}
