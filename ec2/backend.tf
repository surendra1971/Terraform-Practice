terraform {
  backend "s3" {
    bucket         = "tf-state-surendra"
    key            = "dev/terraform.tfstate"     # This is like the folder path that you prefer giving
    region         = "us-west-2"
  }
}