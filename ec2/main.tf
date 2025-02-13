provider "aws" {
  region = "us-west-2"
}
resource "aws_instance" "example" {
    ami                        = "ami-0005ee01bca55ab66"
    instance_type              = "t2.micro"
   
}
