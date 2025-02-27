provider "aws" {
  region                    = "us-west-2"
  shared_credentials_files   = ["~/.aws/credentials"]
  profile                   = "default"  # or any profile you use
}

resource "aws_instance" "ec2_example" {
   ami           = "ami-0b9dfa0ef0653492f"
   instance_type =  "t2.micro"
   tags = {
           Name = "Terraform EC2 "
   }
} // id

resource "null_resource" "null_resource_simple" {
   triggers = {
      id = timestamp()
   }
   provisioner "local-exec" {
      command = "echo Hello World"
   }
}