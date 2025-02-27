provider "aws" {
  region                    = "us-west-2"
  shared_credentials_files   = ["~/.aws/credentials"]
  profile                   = "default"  # or any profile you use
}

resource "aws_instance" "ec2_example" {
   ami           = "ami-0b9dfa0ef0653492f"
   instance_type = var.instance_type != "" ? var.instance_type : "t2.micro"

   tags = {
       Name = "Terraform EC2"
   }
}

variable "instance_type" {
   description = "Instance type t2.micro"
   type        = string
   default     = ""

   validation {
      condition     = can(regex("^(t2.nano|t2.micro|t2.small)$", var.instance_type))
      error_message = "Invalid Instance Type. Allowed values: t2.nano, t2.micro, t2.small."
   }
}
