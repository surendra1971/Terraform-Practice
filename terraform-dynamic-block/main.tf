provider "aws" {
  region                    = "us-west-2"
  shared_credentials_files   = ["~/.aws/credentials"]
  profile                   = "default"  # or any profile you use
}

locals {
   ingress_rules = [{
      port        = 443
      description = "Ingress rules for port 443"
   },
   {
      port        = 22
      description = "Ingree rules for port 22"
   }]
}

resource "aws_instance" "ec2_example" {

    ami = "ami-0b9dfa0ef0653492f"  
    instance_type = "t2.micro" 
    key_name= "aws_key"
    vpc_security_group_ids = [aws_security_group.main.id]
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 dynamic "ingress" {
      for_each = local.ingress_rules

      content {
         description = ingress.value.description
         from_port   = ingress.value.port
         to_port     = ingress.value.port
         protocol    = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
      }
   }
  
}


resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfMKjQqoCx+F3zqQTvzejXmqvZWyB9bKePJbIEuS8lB surendra@LAPTOP-OGCF8IH7"
}
