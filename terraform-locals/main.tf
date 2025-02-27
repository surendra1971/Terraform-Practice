provider "aws" {
  region                    = "us-west-2"
  shared_credentials_files   = ["~/.aws/credentials"]
  profile                   = "default"  # or any profile you use
}

locals {
  staging_env = "staging"
}



resource "aws_instance" "ec2_example" {
   
  ami = "ami-0b9dfa0ef0653492f"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.main.id]
  key_name= "aws_key"
   
   tags = {
           Name = "${local.staging_env} - Terraform EC2"
   }
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfMKjQqoCx+F3zqQTvzejXmqvZWyB9bKePJbIEuS8lB surendra@LAPTOP-OGCF8IH7"
}